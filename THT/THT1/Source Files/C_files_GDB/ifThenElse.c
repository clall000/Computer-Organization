void main(){
	int a = 4; // $s0
	int b = 5; // $s1
	int c = 10; // $s2
	int d = 3; // $s3

	if(c<10){
		a = 0 - c;
		b = b + 1;
	}
	else{
		a = c;
		d = d + 1;
	}
}