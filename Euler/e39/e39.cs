using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication2
{
    class Program
    {
    public class tuple3
    {
     public int a;
     public int b;
     public int c;
     public tuple3(){}
     
     public tuple3(int A, int B, int C)
     {
         a=A;
         b=B;
         c=C;
     }

    public Boolean Contains(int x)
     {
         if (a == x || b == x || c == x) return true; return false;
     }
    };
    public class pair
    {
     public int a;
     public List<tuple3> b;
     public pair() {}
     public pair(int A, List<tuple3> B) {a=A;b=B;}
    };
    
    public static bool Pythagorean(int a, int b, int c)
    {
        if(Math.Pow(a,2) + Math.Pow(b,2) == Math.Pow(c,2))
        return true; return false;
    }
    
    public static bool Contains(List<tuple3> list, tuple3 tuple)
    {
        foreach (tuple3 x in list)
            if (x.Contains(tuple.a) && x.Contains(tuple.b) && x.Contains(tuple.c))
                return true; return false;
    }

    public static void FilterEquals(ref List<tuple3> AdjustMe)
    {
        List<tuple3> copy = new List<tuple3>();
        foreach (tuple3 x in AdjustMe)
            if (!Contains(copy, x))
                copy.Add(x);
        AdjustMe = copy;
    }

    static void Main()
    {
        List<pair> Answers = new List<pair>();
        for(int idx=3; idx <= 1000; idx++)
        {
            List<tuple3> Tuples = new List<tuple3>();
            for(int i=1;i<idx;i++)
            {
                for(int j=1; j<idx; j++)
                {
                    for(int k=1; k<idx; k++)
                    {
                        if(i+j+k == idx)
                        {
                            if(Pythagorean(i,j,k))
                                    Tuples.Add(new tuple3(i,j,k));
                        }
                    }
                }
            }
            FilterEquals(ref Tuples);
            Answers.Add(new pair(idx, Tuples));
        }
        int max = int.MinValue;
        int maxidx = -1;
        foreach (pair x in Answers)
            if (x.b.Count > max)
            {
                max = x.b.Count;
                maxidx = x.a;
            }
        Console.WriteLine(maxidx);
    }
    }
}
