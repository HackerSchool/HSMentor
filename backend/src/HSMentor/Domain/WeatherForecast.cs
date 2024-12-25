using HSMentor.Lib.Extensions.EF;

namespace HSMentor.Domain;

public class WeatherForecast
{
    public Guid Id { get; set; }

    public required DateOnly Date { get; init; }

    public required string Summary { get; init; }

    public required int TemperatureC { get; init; }

    public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);

    [CascadeDelete]
    public virtual WeatherForecast? PreviousForecast { get; init; }
}
