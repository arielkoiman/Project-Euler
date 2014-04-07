using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication3
{
    class Program
    {
	//borrowed from http://stackoverflow.com/questions/239865/best-way-to-find-all-factors-of-a-given-number-in-c-sharp
        public static List<int> Factor(int number)
        {
            List<int> factors = new List<int>();
            int max = (int)Math.Sqrt(number);
            for (int factor = 1; factor <= max; ++factor)
            {
                if (number % factor == 0)
                {
                    factors.Add(factor);
                    if (factor != number / factor)
                    {
                        factors.Add(number / factor);
                    }
                }
            }
            return factors;
        }

        public static int IthTriangular(int index)
        {
            int sum=0;
            for (int i = 1; i <= index; i++)
                sum += i;
            return sum;
        }

        static void Main(string[] args)
        {
            int answer = 0;
            for (int i = 1; ; i++)
            {
                int itht = IthTriangular(i);
                answer =IthTriangular(i);
                if (Factor(answer).Count > 500) break;
            }
            Console.WriteLine(answer);
            Console.ReadKey();
        }
    }
}
