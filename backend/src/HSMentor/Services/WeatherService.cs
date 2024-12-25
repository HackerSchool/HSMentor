using HSMentor.Domain;
using HSMentor.Lib.Extensions.DI;
using HSMentor.Persistence;
using Microsoft.EntityFrameworkCore;

namespace HSMentor.Services;

[Service]
public class WeatherService(HSMentorDbContext dbContext)
{
    private readonly HSMentorDbContext _dbContext = dbContext;

    private static readonly string[] summaries =
    [
        "Freezing",
        "Bracing",
        "Chilly",
        "Cool",
        "Mild",
        "Warm",
        "Balmy",
        "Hot",
        "Sweltering",
        "Scorching",
    ];

    public async Task<WeatherForecast> CreateForecast()
    {
        WeatherForecast? previousForecast = await _dbContext
            .WeatherForecasts.OrderByDescending(e => e.Id) // Get the forecast with bigger GUID (to simulate the most recent one, this doesn't work irl)
            .FirstOrDefaultAsync();

        WeatherForecast weatherForecast = new()
        {
            Id = Guid.NewGuid(),
            TemperatureC = Random.Shared.Next(-20, 55),
            Summary = summaries[Random.Shared.Next(summaries.Length)],
            Date = DateOnly.FromDateTime(DateTime.Now),
            PreviousForecast = previousForecast,
        };

        _dbContext.Add(weatherForecast);
        await _dbContext.SaveChangesAsync();
        return weatherForecast;
    }

    public async Task<IEnumerable<WeatherForecast>> GetAllForecasts()
    {
        List<WeatherForecast> weatherForecasts = [];

        WeatherForecast? curr = await _dbContext
            .WeatherForecasts.OrderByDescending(e => e.Id)
            .FirstOrDefaultAsync();

        while (curr != null)
        {
            weatherForecasts.Add(curr);
            curr = curr.PreviousForecast; // This is a call to a proxy of WeatherForecast that triggers an entity fetch.
            // Unfortunately, this type of fetches (lazy loading via proxy) are always made synchronously in ef
        }

        return weatherForecasts;
    }

    public async Task<WeatherForecast?> GetForecast(Guid guid)
    {
        return await _dbContext.WeatherForecasts.FindAsync(guid);
    }

    public async Task<WeatherForecast?> DeleteForecast(Guid guid)
    {
        WeatherForecast? weatherForecast = await _dbContext.WeatherForecasts.FindAsync(guid);

        if (weatherForecast is null)
        {
            return null;
        }

        _dbContext.WeatherForecasts.Remove(weatherForecast);
        await _dbContext.SaveChangesAsync();

        return weatherForecast;
    }
}
