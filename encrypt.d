// Basic dual way encrypting program. Has very low primes and is easy to break.
import std.stdio, std.random, std.math;

private const ulong e = 3;
private ulong n;

void main() {
	newMod();
	ulong priv = uniform (1, 40);
	ulong pub = (pow(e, priv) % n);

	writeln("Your current exponent is ", e, ", and your modulus is ", n , ". Also your private number is ", priv);
	writeln("Your public key is ", pub);
	writeln("Please send your partner this number and input what they tell you.");
	ulong transpub;
	readf(" %s", &transpub);
	ulong share = (pow(transpub, priv) % n);
	writeln("Ok. Your shared key is ", share, ", please do not tell anyone.");
	writeln("Your partner should be at the same conclusion.");
}

void newMod() {
	writeln("Do you need a new modulus generated? (y/n)");
	char yn;
	readf(" %s", &yn);
	if (yn == 'y') {n = makeMod();}
	else if (yn == 'n') {
		writeln("Ok, please enter your modulus");
		readf(" %s", &n);
}
	else {newMod();}
}

public ulong makeMod() {
	int p = randPrime();
	int q = randPrime();
	return cast(ulong)(p*q);
}

private int randPrime(){
	//gets all the primes and puts them in a array
	int[25] pri;
	int j;
	for (int i = 2; i <= 100; i++){
		//I NEED TO MAKE PRIME FUNCTION EWWWW
		if (isPrime(i)) {
			pri[j] = i;
			j++;
		}
	}
	auto rand = uniform(2, j+1);
	return pri[rand];
}

private bool isPrime(int i){
	bool an;
	for (int p = 2; p < i; p++){
	if (i%p == 0) {
		an = false;
		break;
	}
	else an = true;
}
return an;
}
