using HSMentor.Persistence;
using Microsoft.EntityFrameworkCore;

namespace HSMentor.Test.Lib;

public class DbContextFactory
{
    public static HSMentorDbContext CreateInMemoryDatabase()
    {
        var options = new DbContextOptionsBuilder<HSMentorDbContext>()
            .UseInMemoryDatabase("HSMentorInMemory")
            .UseLazyLoadingProxies()
            .Options;

        return new HSMentorDbContext(options);
    }
}
