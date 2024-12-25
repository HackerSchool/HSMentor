using HSMentor.Domain;
using HSMentor.Lib.Extensions.DI;
using HSMentor.Persistence;

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

    public WeatherForecast CreateForecast()
    {
        WeatherForecast? previousForecast = _dbContext
            .WeatherForecasts.OrderByDescending(e => e.Id) // Get the forecast with bigger GUID (to simulate the most recent one, this doesn't work irl)
            .FirstOrDefault();

        WeatherForecast weatherForecast = new()
        {
            Id = Guid.NewGuid(),
            TemperatureC = Random.Shared.Next(-20, 55),
            Summary = summaries[Random.Shared.Next(summaries.Length)],
            Date = DateOnly.FromDateTime(DateTime.Now),
            PreviousForecast = previousForecast,
        };

        _dbContext.Add(weatherForecast);
        _dbContext.SaveChanges();
        return weatherForecast;
    }

    public IEnumerable<WeatherForecast> GetAllForecasts()
    {
        List<WeatherForecast> weatherForecasts = [];

        WeatherForecast? curr = _dbContext
            .WeatherForecasts.OrderByDescending(e => e.Id)
            .FirstOrDefault();

        while (curr != null)
        {
            weatherForecasts.Add(curr);
            curr = curr.PreviousForecast;
        }

        return weatherForecasts;
    }

    public WeatherForecast? GetForecast(Guid guid)
    {
        return _dbContext.WeatherForecasts.Find(guid);
    }

    public WeatherForecast? DeleteForecast(Guid guid)
    {
        WeatherForecast? weatherForecast = _dbContext.WeatherForecasts.Find(guid);

        if (weatherForecast is null)
        {
            return null;
        }

        _dbContext.WeatherForecasts.Remove(weatherForecast);
        _dbContext.SaveChanges();

        return weatherForecast;
    }
}
