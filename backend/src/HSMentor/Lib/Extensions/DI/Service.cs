using System.Reflection;

namespace HSMentor.Lib.Extensions.DI;

public static class DIServiceExtension
{
    public static IServiceCollection AddServices(this IServiceCollection serviceCollection)
    {
        foreach (var assembly in AppDomain.CurrentDomain.GetAssemblies())
        {
            foreach (var type in assembly.GetTypes())
            {
                if (!type.IsClass)
                    continue;

                foreach (var attribute in type.GetCustomAttributes())
                {
                    if (attribute is ServiceAttribute serviceAttribute)
                    {
                        switch (serviceAttribute.ServiceLifetime)
                        {
                            case ServiceLifetime.Singleton:
                                serviceCollection.AddSingleton(type);
                                break;
                            case ServiceLifetime.Scoped:
                                serviceCollection.AddScoped(type);
                                break;
                            case ServiceLifetime.Transient:
                            default:
                                serviceCollection.AddTransient(type);
                                break;
                        }
                    }
                }
            }
        }

        return serviceCollection;
    }
}

[AttributeUsage(AttributeTargets.Class)]
public class ServiceAttribute(ServiceLifetime serviceLifetime) : Attribute
{
    public ServiceLifetime ServiceLifetime { get; } = serviceLifetime;

    public ServiceAttribute()
        : this(ServiceLifetime.Transient) { }
}
