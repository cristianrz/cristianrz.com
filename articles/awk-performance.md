# AWK vs other scripting languages

###### Mon  4 May 13:48:22 BST 2020

I was just wondering how would awk compare to other scripting languages such as
Perl, Python, etc and, for fun, also Go and C. In the end it all comes down to what is the task that you
want to do with it but I though I would do some quick tests...

The test I did was calculating the number Pi iteratively. I didn't want to use
any of the special features that each language have and I calculated it with a
specially inefficient method. This would roughly give me an estimate of how
fast each language each is on "brute force" type of programs.

The code for the awk implementation was:

```
#!/usr/bin/awk -f
BEGIN {
	max = 2 ** 22
	ex = -1

	for (i=1; i<max; i++) {
		ex = -ex
		under = 2*i - 1
		piplus = (4/under)*ex
		pi = pi + piplus
	}

	printf "%.f, %.10f\n",max,pi
}
```

This represents the
<a href="https://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80" target="_blank">
Leibniz Formula for Pi</a> and `max = 2 * 22` tells the program to calculate a
number of elements of 2^22. The other languages implementations are exactly
the same lines of code but in their respective languages.

These were the results:

<style>
table {
	  border-collapse: collapse;
}
th, td {
	border:1px solid black;
}
</style>
<table>
	<tr>
		<th>time in ms</th><th>times slower than Go</th><th>language</th>
	</tr>
	<tr>
		<td>0.023</td><td>1.0</td><td>Go</td>
	</tr>
	<tr>
		<td>0.032</td><td>1.4</td><td>C</td>
	</tr>
	<tr>
		<td>0.230</td><td>10.0</td><td>NodeJS</td>
	</tr>
	<tr>
		<td>0.526</td><td>22.9</td><td>Lua</td>
	</tr>
	<tr>
		<td>1.311</td><td>57.0</td><td>Awk</td>
	</tr>
	<tr>
		<td>1.431</td><td>62.2</td><td>Perl</td>
	</tr>
	<tr>
		<td>1.449</td><td>63.0</td><td>Python</td>
	</tr>
	<tr>
		<td>10.345</td><td>449.8</td><td>bc</td>
	</tr>
</table>

Even though **this test is not the most representative ever**, it shows that for
this type of code can perform slightly faster than Perl or Python.
