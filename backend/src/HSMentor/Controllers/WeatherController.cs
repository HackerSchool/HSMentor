using HSMentor.Domain;
using HSMentor.Services;
using Microsoft.AspNetCore.Mvc;

namespace HSMentor.Controllers;

[ApiController]
[Route("[controller]")]
public class WeatherController(WeatherService weatherService) : ControllerBase
{
    private readonly WeatherService _weatherService = weatherService;

    [HttpPost]
    public async Task<IActionResult> CreateForecast()
    {
        // Proccess request (get whats needed from the request, nothing in this case)

        // Invoke Service that fulfills the Use-Case
        WeatherForecast weatherForecast = await _weatherService.CreateForecast();

        // Create Response Based on the result from the Service
        return CreatedAtAction(
            actionName: nameof(GetForecast),
            routeValues: new { reportId = weatherForecast.Id },
            value: WeatherForecastResponse.FromDomain(weatherForecast)
        );
    }

    [HttpGet]
    public async Task<IActionResult> GetAllForecastsAsync()
    {
        // Process request

        // Invoke Service that fulfills the Use-Case
        IEnumerable<WeatherForecast> forecasts = await _weatherService.GetAllForecasts();

        return Ok(GetAllForecastsResponse.FromDomain(forecasts));
    }

    [HttpGet("{reportId:guid}")]
    public async Task<IActionResult> GetForecast(Guid reportId)
    {
        // Process request

        // Invoke Service that fulfills the Use-Case
        WeatherForecast? weatherForecast = await _weatherService.GetForecast(reportId);

        // Create Response Based on the result from the Service
        return weatherForecast is null
            ? NotFound()
            : Ok(WeatherForecastResponse.FromDomain(weatherForecast));
    }

    [HttpDelete("{reportId:guid}")]
    public async Task<IActionResult> DeleteForecast(Guid reportId)
    {
        // Process request

        // Invoke Service that fulfills the Use-Case
        WeatherForecast? weatherForecast = await _weatherService.DeleteForecast(reportId);

        // Create Response Based on the result from the Service
        return weatherForecast is null
            ? NotFound()
            : Ok(WeatherForecastResponse.FromDomain(weatherForecast));
    }
}

public record WeatherForecastResponse(
    DateOnly Date,
    string Summary,
    int TemperatureC,
    int TemperatureF
)
{
    public static WeatherForecastResponse FromDomain(WeatherForecast weatherForecast)
    {
        return new WeatherForecastResponse(
            weatherForecast.Date,
            weatherForecast.Summary,
            weatherForecast.TemperatureC,
            weatherForecast.TemperatureF
        );
    }
};

public record GetAllForecastsResponse(List<WeatherForecastResponse> Elements)
{
    public static GetAllForecastsResponse FromDomain(IEnumerable<WeatherForecast> weatherForecasts)
    {
        List<WeatherForecastResponse> elements = [];

        foreach (var forecast in weatherForecasts)
        {
            elements.Add(WeatherForecastResponse.FromDomain(forecast));
        }

        return new GetAllForecastsResponse(elements);
    }
}
