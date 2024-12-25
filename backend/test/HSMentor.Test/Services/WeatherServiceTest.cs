using HSMentor.Services;
using HSMentor.Test.Lib;

namespace HSMentor.Test.Services;

public class WeatherServiceTest
{
    /*
        Auxiliary method that creates a WeatherService on demand.
    */
    public static WeatherService BuildWeatherService()
    {
        var dbContext = DbContextFactory.CreateInMemoryDatabase();

        return new WeatherService(dbContext);
    }

    /*
        Example service layer test
    */
    [Fact]
    public async Task CreateForecastAndCheckIfExistsAsync()
    {
        // Get service instance
        var weatherService = BuildWeatherService();

        // Create a weather forecast
        var weatherForecastCreated = await weatherService.CreateForecast();

        // Try to get forecast with the id from previous creation
        var weatherForecastGotten = await weatherService.GetForecast(weatherForecastCreated.Id);

        // Check if they are the same object
        Assert.Equal(weatherForecastGotten, weatherForecastCreated);

        // Get list of all forecasts
        var weatherForecastList = await weatherService.GetAllForecasts();

        // Assert that the list contains a single forecast, which is the one created
        Assert.Single(weatherForecastList, weatherForecastCreated);
    }
}
