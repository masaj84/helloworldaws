var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

var app = builder.Build();

// Configure the HTTP request pipeline.

app.MapGet("/home", () =>
{
    var result = string.Format("{0}: {1}", "Hello from REST API ", DateTime.UtcNow.ToString());
    return result;
});

app.Run();
