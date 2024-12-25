namespace HSMentor.Test.Domain;

using HSMentor.Domain;
using Moq;

public class WeatherForecastTest
{
    /*
        Example of a domain logic unit test, where we test the conversion from celsius to fahrenheit
    */
    [Fact]
    public void TemperatureConvertion()
    {
        // Define a temperature example in celsius
        var temperatureC = 21;

        // Create WeatherForecast with said temperature
        var weatherForecast = new WeatherForecast()
        {
            TemperatureC = temperatureC,
            Summary = "Test",
            Date = DateOnly.FromDateTime(DateTime.Now),
        };

        // Compute manually what the temperature should be in fahrenheit
        var tempeartureF = 32 + (int)(temperatureC / 0.5556);

        // Assert that the property of the object is equal to the manually computed value
        Assert.Equal(weatherForecast.TemperatureF, tempeartureF);
    }

    /*
        Example of a unit test that uses mocks
    */
    [Fact]
    public void PreviousForecast()
    {
        // Create an example of a WeatherForecast to be considered the previous one
        var previousForecast = new WeatherForecast()
        {
            TemperatureC = 10,
            Summary = "Test",
            Date = DateOnly.FromDateTime(DateTime.Now),
        };

        // Create a mock of a WeatherForecast that will be the current one
        var currentForecastMock = new Mock<WeatherForecast>();

        // Setup mock so it returns the previously defined forecast when .PreviousForecast is called
        currentForecastMock
            .Setup(forecast => forecast.PreviousForecast) // Choose which method/property is being mocked (can only be done with virtual methods/properties)
            .Returns(previousForecast); // Define the value that said property / method call should return

        // Build mock object
        var currentForecast = currentForecastMock.Object;

        // Assert that mocked property is returning the expected object
        Assert.Equal(previousForecast, currentForecast.PreviousForecast);
    }
}
