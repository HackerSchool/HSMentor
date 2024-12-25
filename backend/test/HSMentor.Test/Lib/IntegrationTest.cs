using System.Text.Json;

namespace HSMentor.Test.Lib;

public abstract class IntegrationTest : IClassFixture<HSMentorWebApplicationFactory>, IDisposable
{
    private readonly HSMentorWebApplicationFactory _factory;

    protected HttpClient Client { get; private set; }

    protected IntegrationTest(HSMentorWebApplicationFactory factory)
    {
        _factory = factory;
        Client = _factory.CreateClient();
        BeforeTests(_factory);
    }

    // Function called on initialization of the whole test suit (class)
    protected virtual void BeforeTests(HSMentorWebApplicationFactory factory) { }

    // Function called on dispose of the whole test suit (class)
    protected virtual void AfterTests(HSMentorWebApplicationFactory factory) { }

    public void Dispose()
    {
        GC.SuppressFinalize(this);
        AfterTests(_factory);
    }

    private static JsonSerializerOptions SerializerOptions { get; } =
        new() { PropertyNameCaseInsensitive = true };

    public static T? DeserializeJson<T>(string jsonString)
    {
        return JsonSerializer.Deserialize<T>(jsonString, SerializerOptions);
    }

    public static string SerializeJson<T>(T obj)
    {
        return JsonSerializer.Serialize(obj, SerializerOptions);
    }
}
