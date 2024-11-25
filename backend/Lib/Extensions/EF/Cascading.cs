using Microsoft.EntityFrameworkCore;

namespace HSMentor.Lib.Extensions.EF;

public static class EFCascadingExtension
{
    public static DbContext SetAttributesToCascade(
        this DbContext context,
        ModelBuilder modelBuilder
    )
    {
        foreach (var entityType in modelBuilder.Model.GetEntityTypes())
        {
            foreach (var property in entityType.ClrType.GetProperties())
            {
                if (Attribute.IsDefined(property, typeof(CascadeDeleteAttribute)))
                {
                    var navigation = entityType.FindNavigation(property.Name);
                    if (navigation != null)
                    {
                        navigation.SetPropertyAccessMode(PropertyAccessMode.Field);
                        navigation.ForeignKey.DeleteBehavior = DeleteBehavior.Cascade;
                    }
                }
            }
        }

        return context;
    }
}

[AttributeUsage(AttributeTargets.Property)]
public class CascadeDeleteAttribute : Attribute;
