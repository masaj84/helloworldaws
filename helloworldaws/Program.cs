var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

var app = builder.Build();

// Configure the HTTP request pipeline.

app.MapGet("/home", () =>
{
    var result = string.Format("{0}: {1}", "Hello from REST for {3}", DateTime.UtcNow.ToString(), DateTime.Now.DayOfWeek.ToString());
    return result;
});

app.Run();
