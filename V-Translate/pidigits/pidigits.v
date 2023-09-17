[translated]
module main

fn putc(__c int, __stream &C.FILE) int

fn putchar(__c int) int

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
type Mp_limb_signed_t = int
type Mp_bitcnt_t = u32
struct Mpz_struct { 
	_mp_alloc int
	_mp_size int
	_mp_d &Mp_limb_t
}
type MP_INT = Mpz_struct
type Mpz_t = [1]mpz_struct
type Mp_ptr = &Mp_limb_t
type Mp_srcptr = &Mp_limb_t
type Mp_size_t = int
type Mp_exp_t = int
struct Mpq_struct { 
	_mp_num mpz_struct
	_mp_den mpz_struct
}
type MP_RAT = Mpq_struct
type Mpq_t = [1]mpq_struct
struct Mpf_struct { 
	_mp_prec int
	_mp_size int
	_mp_exp Mp_exp_t
	_mp_d &Mp_limb_t
}
type Mpf_t = [1]mpf_struct
enum Gmp_randalg_t {
	gmp_rand_alg_default = 0	gmp_rand_alg_lc = gmp_rand_alg_default}

struct Gmp_randstate_struct { 
	_mp_seed Mpz_t
	_mp_alg Gmp_randalg_t
	_mp_algdata Union (unnamed union at /usr/include/x86_64-linux-gnu/gmp.h
}
type Gmp_randstate_t = [1]gmp_randstate_struct
type Mpz_srcptr = &mpz_*
type Mpz_ptr = &mpz_*
type Mpf_srcptr = &mpf_*
type Mpf_ptr = &mpf_*
type Mpq_srcptr = &mpq_*
type Mpq_ptr = &mpq_*

const ( // empty enum
	gmp_error_none = 0	gmp_error_unsupported_argument = 1	gmp_error_division_by_zero = 2	gmp_error_sqrt_of_negative = 4	gmp_error_invalid_argument = 8)

[weak]__global ( n1 Mpz_t 

)

[weak]__global ( n2 Mpz_t 

)

[weak]__global ( d Mpz_t 

)

[weak]__global ( u Mpz_t 

)

[weak]__global ( v Mpz_t 

)

[weak]__global ( w Mpz_t 

)

fn main()  {
	k := 1
k2 := 0
	i := 0

	n := C.atoi(os.argv [1] )
	__gmpz_init(u)
	__gmpz_init(v)
	__gmpz_init_set_si(w, 0)
	__gmpz_init_set_si(n1, 4)
	__gmpz_init_set_si(n2, 3)
	__gmpz_init_set_si(d, 1)
	for  ;  ;  {
		__gmpz_tdiv_q(u, n1, d)
		__gmpz_tdiv_q(v, n2, d)
		if __gmpz_cmp(u, v) == 0 {
			putchar(`0` + __gmpz_get_si(u))
			i ++
			if i % 10 == 0 {
			C.printf(c'\t:%d\n', i)
			}
			if i == n {
			break
			
			}
			__gmpz_mul_si(u, u, -10)
			__gmpz_mul(u, d, u)
			__gmpz_mul_si(n1, n1, 10)
			__gmpz_add(n1, n1, u)
			__gmpz_mul_si(n2, n2, 10)
			__gmpz_add(n2, n2, u)
		}
		else {
			k2 = k * 2
			__gmpz_mul_si(u, n1, k2 - 1)
			__gmpz_add(v, n2, n2)
			__gmpz_mul_si(w, n1, k - 1)
			__gmpz_add(n1, u, v)
			__gmpz_mul_si(u, n2, k + 2)
			__gmpz_add(n2, w, u)
			__gmpz_mul_si(d, d, k2 + 1)
			k ++
		}
	}
	if i % 10 != 0 {
	C.printf(c'%*s\t:%d\n', 10 - n % 10, c'', n)
	}
	return 
}

