[translated]
module main

struct Mallinfo {
	arena    int
	ordblks  int
	smblks   int
	hblks    int
	hblkhd   int
	usmblks  int
	fsmblks  int
	uordblks int
	fordblks int
	keepcost int
}

struct Mallinfo2 {
	arena    usize
	ordblks  usize
	smblks   usize
	hblks    usize
	hblkhd   usize
	usmblks  usize
	fsmblks  usize
	uordblks usize
	fordblks usize
	keepcost usize
}

const ( // empty enum
	fp_nan       = 0
	fp_infinite  = 1
	fp_zero      = 2
	fp_subnormal = 3
	fp_normal    = 4
)

struct Lldiv_t {
	quot i64
	rem  i64
}

fn atol(__nptr &i8) int

struct Random_data {
	fptr      &int
	rptr      &int
	state     &int
	rand_type int
	rand_deg  int
	rand_sep  int
	end_ptr   &int
}

struct Drand48_data {
	__x     [3]u16
	__old_x [3]u16
	__c     u16
	__init  u16
	__a     i64
}

struct TreeNode {
	left  &Tn
	right &Tn
}

[c: 'NewTreeNode']
fn newtreenode(left &TreeNode, right &TreeNode) &TreeNode {
	new := &TreeNode(0)
	new = &TreeNode(C.malloc(sizeof(TreeNode)))
	new.left = left
	new.right = right
	return new
}

[c: 'ItemCheck']
fn itemcheck(tree &TreeNode) int {
	if tree.left == (unsafe { nil }) {
		return 1
	} else {
		return 1 + itemcheck(tree.left) + itemcheck(tree.right)
	}
}

[c: 'BottomUpTree']
fn bottomuptree(depth u32) &TreeNode {
	if depth > 0 {
		return newtreenode(bottomuptree(depth - 1), bottomuptree(depth - 1))
	} else {
		return newtreenode((unsafe { nil }), (unsafe { nil }))
	}
}

[c: 'DeleteTree']
fn deletetree(tree &TreeNode) {
	if tree.left != (unsafe { nil }) {
		deletetree(tree.left)
		deletetree(tree.right)
	}
	C.free(tree)
}

fn main() {
	n := u32(0)
	depth := u32(0)
	mindepth := u32(0)
	maxdepth := u32(0)
	stretchdepth := u32(0)

	stretchtree := &TreeNode(0)
	longlivedtree := &TreeNode(0)
	temptree := &TreeNode(0)

	n = atol(os.argv[1])
	mindepth = 4
	if (mindepth + 2) > n {
		maxdepth = mindepth + 2
	} else { // 3
		maxdepth = n
	}
	stretchdepth = maxdepth + 1
	stretchtree = bottomuptree(stretchdepth)
	C.printf(c'stretch tree of depth %u\t check: %li\n', stretchdepth, itemcheck(stretchtree))
	deletetree(stretchtree)
	longlivedtree = bottomuptree(maxdepth)
	for depth = mindepth; depth <= maxdepth; depth += 2 {
		i := 0
		iterations := 0
		check := 0

		iterations = pow(2, maxdepth - depth + mindepth)
		check = 0
		for i = 1; i <= iterations; i++ {
			temptree = bottomuptree(depth)
			check += itemcheck(temptree)
			deletetree(temptree)
		}
		C.printf(c'%li\t trees of depth %u\t check: %li\n', iterations, depth, check)
	}
	C.printf(c'long lived tree of depth %u\t check: %li\n', maxdepth, itemcheck(longlivedtree))
	return
}
