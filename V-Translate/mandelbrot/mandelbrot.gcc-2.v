[translated]
module main

fn putc(__c int, __stream &C.FILE) int

struct Lldiv_t { 
	quot i64
	rem i64
}
struct Random_data { 
	fptr &int
	rptr &int
	state &int
	rand_type int
	rand_deg int
	rand_sep int
	end_ptr &int
}
struct Drand48_data { 
	__x [3]u16
	__old_x [3]u16
	__c u16
	__init u16
	__a i64
}
fn main()  {
	w := 0
	h := 0
	bit_num := 0

	byte_acc := 0
	i := 0
	iter := 50

	x := 0.0
	y := 0.0
	limit := 2

	zr := 0.0
	zi := 0.0
	cr := 0.0
	ci := 0.0
	tr := 0.0
	ti := 0.0
	
	w = C.atoi(os.argv [1] )
	h = w
	C.printf(c'P4\n%d %d\n', w, h)
	for y = 0 ; y < h ; y ++ {
		for x = 0 ; x < w ; x ++ {
			zr = tr = 0
			ti = tr
			zi = zr
			cr = (2 * x / w - 1.5)
			ci = (2 * y / h - 1)
			for i = 0 ; i < iter && (tr + ti <= limit * limit) ; i ++ {
				zi = 2 * zr * zi + ci
				zr = tr - ti + cr
				tr = zr * zr
				ti = zi * zi
			}
			byte_acc <<= 1
			if tr + ti <= limit * limit {
			byte_acc |= 1
			}
			bit_num ++$
			if bit_num == 8 {
				putc(byte_acc, C.stdout)
				byte_acc = 0
				bit_num = 0
			}
			else if x == w - 1 {
				byte_acc <<= (8 - w % 8)
				putc(byte_acc, C.stdout)
				byte_acc = 0
				bit_num = 0
			}
		}
	}
}

