using FluentAssertions;
using NUnit.Framework;

namespace SonarCloud.Travis.Integration.Tests
{
    [TestFixture]
    public class SampleServiceTests
    {
        [Test]
        public void Should_Add_ForStandardInput()
        {
            //arrange
            decimal first = 1m;
            decimal second = 2m;
            decimal expectedSum = 3m;
            ISampleService sampleService = new SampleService();

            //act
            decimal sum = sampleService.Add(first, second);

            //assert
            sum.Should().Be(expectedSum);
        }
    }
}