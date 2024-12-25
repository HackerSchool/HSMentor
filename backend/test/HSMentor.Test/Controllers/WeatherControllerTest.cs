using HSMentor.Controllers;
using HSMentor.Domain;
using HSMentor.Persistence;
using HSMentor.Test.Lib;
using Microsoft.Extensions.DependencyInjection;

namespace HSMentor.Test.Controllers;

public class WeatherControllerTest(HSMentorWebApplicationFactory factory) : IntegrationTest(factory)
{
    protected override void BeforeTests(HSMentorWebApplicationFactory factory)
    {
        // Creates a scope in the app service provider (IoC container)
        // This scope gets disposed of at the end of the code scope
        using var scopedServices = factory.Services.CreateScope();

        // Gets the service provider of said scope
        var scopedServiceProvider = scopedServices.ServiceProvider;

        // Gets an instance of the HSMentorDbContext service
        var dbContext = scopedServiceProvider.GetService<HSMentorDbContext>();

        // Inserts an entity in the db
        dbContext?.WeatherForecasts.Add(
            new WeatherForecast()
            {
                TemperatureC = 10,
                Summary = "Test",
                Date = DateOnly.FromDateTime(DateTime.Now),
            }
        );

        // Commits
        dbContext?.SaveChanges();
    }

    [Fact]
    public async Task GetWeatherForecasts()
    {
        // Makes a request to the endpoint "/weather/" (gets you a list of the weathers)
        var response = await Client.GetAsync("/weather/");

        // Ensures that the request was successful
        response.EnsureSuccessStatusCode();

        // Awaits the response body content and puts it into a string
        var responseContentJsonString = await response.Content.ReadAsStringAsync();

        // Parses the json into a record
        var responseContent = DeserializeJson<GetAllForecastsResponse>(responseContentJsonString);

        // Asserts the content was correct
        Assert.NotNull(responseContent);
        Assert.NotNull(responseContent.Elements);
        Assert.Single(responseContent.Elements);
    }
}
