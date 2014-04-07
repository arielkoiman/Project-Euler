using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace e49
{
    class Program
    {
        public static bool IsPrime(int val)
        {
        List<int> PrimeNumbers = new List<int>();
        int CheckNumber = 5;
        bool divisible = true;
        PrimeNumbers.Add(2);
        PrimeNumbers.Add(3);

        // Populating the Prime Number Collection
        while (CheckNumber < val)
        {
            foreach (int i in PrimeNumbers)
            {
                if (CheckNumber % i == 0)
                {
                    divisible = false;
                    break;
                }
                if (i * i > CheckNumber) { break; }
            }
            if (divisible == true) { PrimeNumbers.Add(CheckNumber); }
            else { divisible = true; }
            CheckNumber += 2;
        }
        foreach (int i in PrimeNumbers)
        {
            if (CheckNumber % i == 0)
            {
                divisible = false;
                break;
            }
            if (i * i > CheckNumber) { break; }
        }
        if (divisible == true) { PrimeNumbers.Add(CheckNumber); }
        else { divisible = true; }

        // Use the Prime Number Collection to determine if val is prime
        foreach (int i in PrimeNumbers)
        {
            if (val % i == 0) { return false; }
            if (i * i > val) { return true; }
        }
        // Shouldn't ever get here, but needed to build properly.
        return true;
    }

        public static Int32[] GetPermutations(int Val)
        {
            String val = Convert.ToString(Val);
            string[] vals = new string[24];
            vals[0] = val;
            vals[1] = Convert.ToString(val[0].ToString() + val[1].ToString() + val[3].ToString() + val[2].ToString());
            vals[2] = Convert.ToString(val[0].ToString() + val[2].ToString() + val[1].ToString() + val[3].ToString());
            vals[3] = Convert.ToString(val[0].ToString() + val[2].ToString() + val[3].ToString() + val[1].ToString());
            vals[4] = Convert.ToString(val[0].ToString() + val[3].ToString() + val[1].ToString() + val[2].ToString());
            vals[5] = Convert.ToString(val[0].ToString() + val[3].ToString() + val[2].ToString() + val[1].ToString());
            vals[6] = Convert.ToString(val[1].ToString() + val[0].ToString() + val[2].ToString() + val[3].ToString());  
            vals[7] = Convert.ToString(val[1].ToString() + val[0].ToString() + val[3].ToString() + val[2].ToString());
            vals[8] = Convert.ToString(val[1].ToString() + val[2].ToString() + val[0].ToString() + val[3].ToString());
            vals[9] = Convert.ToString(val[1].ToString() + val[2].ToString() + val[3].ToString() + val[0].ToString());
            vals[10] = Convert.ToString(val[1].ToString() + val[3].ToString() + val[0].ToString() + val[2].ToString());
            vals[11] = Convert.ToString(val[1].ToString() + val[3].ToString() + val[2].ToString() + val[0].ToString());
            vals[12] = Convert.ToString(val[2].ToString() + val[0].ToString() + val[1].ToString() + val[3].ToString());
            vals[13] = Convert.ToString(val[2].ToString() + val[0].ToString() + val[3].ToString() + val[1].ToString());
            vals[14] = Convert.ToString(val[2].ToString() + val[1].ToString() + val[0].ToString() + val[3].ToString());
            vals[15] = Convert.ToString(val[2].ToString() + val[1].ToString() + val[3].ToString() + val[0].ToString());
            vals[16] = Convert.ToString(val[2].ToString() + val[3].ToString() + val[0].ToString() + val[1].ToString());
            vals[17] = Convert.ToString(val[2].ToString() + val[3].ToString() + val[1].ToString() + val[0].ToString());
            vals[18] = Convert.ToString(val[3].ToString() + val[0].ToString() + val[1].ToString() + val[2].ToString());
            vals[19] = Convert.ToString(val[3].ToString() + val[0].ToString() + val[2].ToString() + val[1].ToString());
            vals[20] = Convert.ToString(val[3].ToString() + val[1].ToString() + val[0].ToString() + val[2].ToString());
            vals[21] = Convert.ToString(val[3].ToString() + val[1].ToString() + val[2].ToString() + val[0].ToString());
            vals[22] = Convert.ToString(val[3].ToString() + val[2].ToString() + val[0].ToString() + val[1].ToString());
            vals[23] = Convert.ToString(val[3].ToString() + val[2].ToString() + val[1].ToString() + val[0].ToString());

            Int32[] Vals = new Int32[24];
            for (int i = 0; i < 24; i++)
                Vals[i] = Convert.ToInt32(vals[i]);
            return Vals;
        }

        public static List<int> NumPrimes(int[] arr)
        {
            List<int> primes = new List<int>();
            foreach (int x in arr)
                if ((IsPrime(x))&&Convert.ToString(x).Length == 4) primes.Add(x);
            return primes;
        }

        public static Tuple<int,int,int> GetDiffTuple(List<int> list)
        {
            for(int i=0;i<list.Count;i++)
            {
                for(int j=0; j<list.Count; j++)
                {
                    for(int k=0; k<list.Count; k++)
                    {
                        if (i == j || i == k || j == k) continue;
                        if ((list[k] - list[j] == list[j] - list[i])&&list[k]-list[j]==3330)
                            return new Tuple<int, int, int>(list[i], list[j], list[k]);
                    }
                }
            }
            return null;
        }

        static void Main(string[] args)
        {
            for(int i=1000; i<10001; i++)
            {
                if(IsPrime(i))
                {
                    Int32[] Perms = GetPermutations(i).ToList().Distinct().ToArray();
                    List<int> primes = NumPrimes(Perms);
                    Tuple<int,int,int> T = GetDiffTuple(primes);
                    if(T != null)
                        Console.WriteLine(Convert.ToString(T.Item1) + Convert.ToString(T.Item2) + Convert.ToString(T.Item3));
                }
            }
            Console.ReadKey();
        }
    }
}
