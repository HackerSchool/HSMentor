using HSMentor.Controllers;
using HSMentor.Test.Lib;

namespace HSMentor.Test.Controllers;

public class WeatherControllerTest2(HSMentorWebApplicationFactory factory) : IntegrationTest(factory)
{

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
        Assert.Empty(responseContent.Elements);
    }
}
