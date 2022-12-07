// 3x+1

(// Collatz machine
~collatz = {
	// 0. Define variables and convert values to accepted formats
	| a current control |
	~results = [a].asInteger;
	control = [a].asInteger;
	current = ~results.last;
	c = true;
	while({c == true}, {
		// 1. Run the algorythm rules
		if(current.even) {
			~results = ~results ++ (current/2);
			control = control ++ (current/2)
		} {
			~results = ~results ++ (current*3+1);
			control = control ++ (current*3+1)
		};
		// 2. Update variables and formats
		~results = ~results.asInteger;
		control = control.sort.asInteger;
		current = ~results.last;
		// 3. Check if the algorythm should keep running (didn't start a repeated pattern)
		control.collect{
			| val i |
			if(val != control.last) {
				b = control[i+1]/(val);
				if((b == 1) || (b == 0)) {c = false};
			}
		};
		c.postln;
	});
	"Resulting stream...".postcln; ~results;
}
)
~collatz.value(9) // 0 still a problem
~results.collect(_.postln)
~results

(
a = rand(2).postln;
b = rand(2).postln;
if((a == 1) || (b == 0)) {true} {false};
)