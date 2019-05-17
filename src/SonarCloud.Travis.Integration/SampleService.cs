namespace SonarCloud.Travis.Integration
{
    public class SampleService : ISampleService
    {
        public decimal Add(decimal first, decimal second)
        {
            return first + second;
        }
    }
}