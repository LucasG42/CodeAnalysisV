[translated]
module main

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
fn max(a int, b int) int {
	return if a > b{ a } else {b}
}

fn fannkuchredux(n int) int {
	perm := [n]int{}
	perm1 := [n]int{}
	count := [n]int{}
	maxflipscount := 0
	permcount := 0
	checksum := 0
	i := 0
	for i = 0 ; i < n ; i += 1 {
	perm1 [i]  = i
	}
	r := n
	for 1 {
		for r != 1 {
			count [r - 1]  = r
			r -= 1
		}
		for i = 0 ; i < n ; i += 1 {
		perm [i]  = perm1 [i] 
		}
		flipscount := 0
		k := 0
		for !((k = perm [0] ) == 0) {
			k2 := (k + 1) >> 1
			for i = 0 ; i < k2 ; i ++ {
				temp := perm [i] 
				perm [i]  = perm [k - i] 
				perm [k - i]  = temp
			}
			flipscount += 1
		}
		maxflipscount = max(maxflipscount, flipscount)
		checksum += if permcount % 2 == 0{ flipscount } else {-flipscount}
		for 1 {
			if r == n {
				C.printf(c'%d\n', checksum)
				return maxflipscount
			}
			perm0 := perm1 [0] 
			i = 0
			for i < r {
				j := i + 1
				perm1 [i]  = perm1 [j] 
				i = j
			}
			perm1 [r]  = perm0
			count [r]  = count [r]  - 1
			if count [r]  > 0 {
			break
			
			}
			r ++
		}
		permcount ++
	}
}

fn main()  {
	n := if argc > 1{ C.atoi(os.argv [1] ) } else {7}
	C.printf(c'Pfannkuchen(%d) = %d\n', n, fannkuchredux(n))
	return 
}

