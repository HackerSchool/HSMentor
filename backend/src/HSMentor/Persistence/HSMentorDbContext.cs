using HSMentor.Domain;
using HSMentor.Lib.Extensions.EF;
using Microsoft.EntityFrameworkCore;

namespace HSMentor.Persistence;

public class HSMentorDbContext(DbContextOptions<HSMentorDbContext> options) : DbContext(options)
{
    public DbSet<WeatherForecast> WeatherForecasts { get; set; } = null!;

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        this.SetAttributesToCascade(modelBuilder);
    }
}
