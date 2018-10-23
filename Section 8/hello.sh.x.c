#if 0
	shc Version 3.8.9b, Generic Script Compiler
	Copyright (c) 1994-2015 Francisco Rosales <frosal@fi.upm.es>

	shc -f hello.sh 
#endif

static  char data [] = 
#define      lsto_z	1
#define      lsto	((&data[0]))
	"\215"
#define      chk2_z	19
#define      chk2	((&data[1]))
	"\067\352\051\171\022\066\144\203\360\021\007\347\145\241\031\021"
	"\336\204\033\115"
#define      msg1_z	42
#define      msg1	((&data[30]))
	"\167\211\051\265\011\365\226\025\115\340\375\340\222\112\144\372"
	"\270\047\306\366\114\100\103\024\213\132\357\040\111\003\224\022"
	"\277\174\126\353\335\250\065\021\246\357\077\045\175\226\362\210"
	"\267\334\105\304\370\170\217\173\060\201\316"
#define      inlo_z	3
#define      inlo	((&data[80]))
	"\100\041\074"
#define      xecc_z	15
#define      xecc	((&data[84]))
	"\266\005\025\373\170\055\107\322\323\310\375\061\016\276\263\311"
	"\124\317"
#define      date_z	1
#define      date	((&data[101]))
	"\060"
#define      pswd_z	256
#define      pswd	((&data[125]))
	"\207\206\024\220\173\253\246\311\160\236\102\377\032\162\200\350"
	"\274\155\040\006\315\300\275\027\272\200\061\174\331\235\051\170"
	"\212\353\143\060\323\322\057\117\071\306\367\014\351\321\156\321"
	"\173\236\027\200\363\032\230\256\232\312\052\163\147\124\354\362"
	"\077\120\042\023\042\121\142\134\030\132\151\002\053\330\323\246"
	"\167\353\047\152\006\300\030\240\212\103\023\362\230\000\345\330"
	"\120\007\353\163\130\115\320\161\247\071\164\323\022\107\171\211"
	"\063\240\363\071\141\014\332\353\120\356\336\351\356\303\301\077"
	"\313\255\262\044\372\202\225\242\274\011\165\316\121\357\130\205"
	"\217\113\277\360\130\231\334\251\207\273\222\165\177\123\264\112"
	"\001\147\156\373\352\003\236\247\015\024\165\137\003\316\344\223"
	"\031\244\204\162\075\140\033\305\034\256\073\233\002\360\346\003"
	"\127\124\377\102\130\235\351\145\261\137\305\264\055\252\107\107"
	"\116\314\271\214\054\325\121\111\204\214\345\206\174\313\211\324"
	"\037\211\026\167\046\377\335\330\136\243\215\213\115\325\322\233"
	"\241\214\050\316\142\171\027\346\006\375\154\203\310\366\127\350"
	"\177\156\137\246\155\075\177\314\340\014\130\056\342\052\312\203"
	"\267\362\122\031\153\152\000\041\220\327\303\167\325\041\326\134"
	"\247\353\354\043\227\222\355\007\061\057\006\113\242\207\063"
#define      tst1_z	22
#define      tst1	((&data[410]))
	"\145\302\025\043\344\022\051\312\325\212\117\114\220\225\003\100"
	"\114\375\203\052\302\163\252\254\043\226\245\245"
#define      shll_z	10
#define      shll	((&data[434]))
	"\317\201\126\071\160\125\206\054\240\270\043"
#define      opts_z	1
#define      opts	((&data[444]))
	"\316"
#define      chk1_z	22
#define      chk1	((&data[450]))
	"\224\166\253\201\175\242\321\157\122\207\240\042\063\150\024\222"
	"\252\144\145\377\231\171\136\054\213\361\215"
#define      text_z	61
#define      text	((&data[483]))
	"\050\123\014\134\262\001\261\027\304\306\073\325\170\010\221\311"
	"\000\370\102\123\072\067\123\353\277\132\055\256\340\313\322\064"
	"\172\040\215\063\232\253\322\251\000\137\076\027\103\327\146\207"
	"\025\360\221\255\273\111\115\035\133\151\271\174\142\063\073\012"
	"\156\001\224\132\323\326\141\103\251\153\065\121\210\005\033\173"
#define      msg2_z	19
#define      msg2	((&data[554]))
	"\112\040\336\037\165\133\065\323\142\150\035\145\031\224\336\225"
	"\247\050\333\232\035\320"
#define      rlax_z	1
#define      rlax	((&data[574]))
	"\273"
#define      tst2_z	19
#define      tst2	((&data[576]))
	"\374\066\143\307\050\236\257\336\346\167\324\206\145\372\343\302"
	"\077\244\167\256\246\337\130\131"/* End of data[] */;
#define      hide_z	4096
#define DEBUGEXEC	0	/* Define as 1 to debug execvp calls */
#define TRACEABLE	0	/* Define as 1 to enable ptrace the executable */

/* rtc.c */

#include <sys/stat.h>
#include <sys/types.h>

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

/* 'Alleged RC4' */

static unsigned char stte[256], indx, jndx, kndx;

/*
 * Reset arc4 stte. 
 */
void stte_0(void)
{
	indx = jndx = kndx = 0;
	do {
		stte[indx] = indx;
	} while (++indx);
}

/*
 * Set key. Can be used more than once. 
 */
void key(void * str, int len)
{
	unsigned char tmp, * ptr = (unsigned char *)str;
	while (len > 0) {
		do {
			tmp = stte[indx];
			kndx += tmp;
			kndx += ptr[(int)indx % len];
			stte[indx] = stte[kndx];
			stte[kndx] = tmp;
		} while (++indx);
		ptr += 256;
		len -= 256;
	}
}

/*
 * Crypt data. 
 */
void arc4(void * str, int len)
{
	unsigned char tmp, * ptr = (unsigned char *)str;
	while (len > 0) {
		indx++;
		tmp = stte[indx];
		jndx += tmp;
		stte[indx] = stte[jndx];
		stte[jndx] = tmp;
		tmp += stte[indx];
		*ptr ^= stte[tmp];
		ptr++;
		len--;
	}
}

/* End of ARC4 */

/*
 * Key with file invariants. 
 */
int key_with_file(char * file)
{
	struct stat statf[1];
	struct stat control[1];

	if (stat(file, statf) < 0)
		return -1;

	/* Turn on stable fields */
	memset(control, 0, sizeof(control));
	control->st_ino = statf->st_ino;
	control->st_dev = statf->st_dev;
	control->st_rdev = statf->st_rdev;
	control->st_uid = statf->st_uid;
	control->st_gid = statf->st_gid;
	control->st_size = statf->st_size;
	control->st_mtime = statf->st_mtime;
	control->st_ctime = statf->st_ctime;
	key(control, sizeof(control));
	return 0;
}

#if DEBUGEXEC
void debugexec(char * sh11, int argc, char ** argv)
{
	int i;
	fprintf(stderr, "shll=%s\n", sh11 ? sh11 : "<null>");
	fprintf(stderr, "argc=%d\n", argc);
	if (!argv) {
		fprintf(stderr, "argv=<null>\n");
	} else { 
		for (i = 0; i <= argc ; i++)
			fprintf(stderr, "argv[%d]=%.60s\n", i, argv[i] ? argv[i] : "<null>");
	}
}
#endif /* DEBUGEXEC */

void rmarg(char ** argv, char * arg)
{
	for (; argv && *argv && *argv != arg; argv++);
	for (; argv && *argv; argv++)
		*argv = argv[1];
}

int chkenv(int argc)
{
	char buff[512];
	unsigned long mask, m;
	int l, a, c;
	char * string;
	extern char ** environ;

	mask  = (unsigned long)&chkenv;
	mask ^= (unsigned long)getpid() * ~mask;
	sprintf(buff, "x%lx", mask);
	string = getenv(buff);
#if DEBUGEXEC
	fprintf(stderr, "getenv(%s)=%s\n", buff, string ? string : "<null>");
#endif
	l = strlen(buff);
	if (!string) {
		/* 1st */
		sprintf(&buff[l], "=%lu %d", mask, argc);
		putenv(strdup(buff));
		return 0;
	}
	c = sscanf(string, "%lu %d%c", &m, &a, buff);
	if (c == 2 && m == mask) {
		/* 3rd */
		rmarg(environ, &string[-l - 1]);
		return 1 + (argc - a);
	}
	return -1;
}

#if !defined(TRACEABLE)

#define _LINUX_SOURCE_COMPAT
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <signal.h>
#include <stdio.h>
#include <unistd.h>

#if !defined(PTRACE_ATTACH) && defined(PT_ATTACH)
#	define PTRACE_ATTACH	PT_ATTACH
#endif
void untraceable(char * argv0)
{
	char proc[80];
	int pid, mine;

	switch(pid = fork()) {
	case  0:
		pid = getppid();
		/* For problematic SunOS ptrace */
#if defined(__FreeBSD__)
		sprintf(proc, "/proc/%d/mem", (int)pid);
#else
		sprintf(proc, "/proc/%d/as",  (int)pid);
#endif
		close(0);
		mine = !open(proc, O_RDWR|O_EXCL);
		if (!mine && errno != EBUSY)
			mine = !ptrace(PTRACE_ATTACH, pid, 0, 0);
		if (mine) {
			kill(pid, SIGCONT);
		} else {
			perror(argv0);
			kill(pid, SIGKILL);
		}
		_exit(mine);
	case -1:
		break;
	default:
		if (pid == waitpid(pid, 0, 0))
			return;
	}
	perror(argv0);
	_exit(1);
}
#endif /* !defined(TRACEABLE) */

char * xsh(int argc, char ** argv)
{
	char * scrpt;
	int ret, i, j;
	char ** varg;
	char * me = argv[0];

	stte_0();
	 key(pswd, pswd_z);
	arc4(msg1, msg1_z);
	arc4(date, date_z);
	if (date[0] && (atoll(date)<time(NULL)))
		return msg1;
	arc4(shll, shll_z);
	arc4(inlo, inlo_z);
	arc4(xecc, xecc_z);
	arc4(lsto, lsto_z);
	arc4(tst1, tst1_z);
	 key(tst1, tst1_z);
	arc4(chk1, chk1_z);
	if ((chk1_z != tst1_z) || memcmp(tst1, chk1, tst1_z))
		return tst1;
	ret = chkenv(argc);
	arc4(msg2, msg2_z);
	if (ret < 0)
		return msg2;
	varg = (char **)calloc(argc + 10, sizeof(char *));
	if (!varg)
		return 0;
	if (ret) {
		arc4(rlax, rlax_z);
		if (!rlax[0] && key_with_file(shll))
			return shll;
		arc4(opts, opts_z);
		arc4(text, text_z);
		arc4(tst2, tst2_z);
		 key(tst2, tst2_z);
		arc4(chk2, chk2_z);
		if ((chk2_z != tst2_z) || memcmp(tst2, chk2, tst2_z))
			return tst2;
		/* Prepend hide_z spaces to script text to hide it. */
		scrpt = malloc(hide_z + text_z);
		if (!scrpt)
			return 0;
		memset(scrpt, (int) ' ', hide_z);
		memcpy(&scrpt[hide_z], text, text_z);
	} else {			/* Reexecute */
		if (*xecc) {
			scrpt = malloc(512);
			if (!scrpt)
				return 0;
			sprintf(scrpt, xecc, me);
		} else {
			scrpt = me;
		}
	}
	j = 0;
	varg[j++] = argv[0];		/* My own name at execution */
	if (ret && *opts)
		varg[j++] = opts;	/* Options on 1st line of code */
	if (*inlo)
		varg[j++] = inlo;	/* Option introducing inline code */
	varg[j++] = scrpt;		/* The script itself */
	if (*lsto)
		varg[j++] = lsto;	/* Option meaning last option */
	i = (ret > 1) ? ret : 0;	/* Args numbering correction */
	while (i < argc)
		varg[j++] = argv[i++];	/* Main run-time arguments */
	varg[j] = 0;			/* NULL terminated array */
#if DEBUGEXEC
	debugexec(shll, j, varg);
#endif
	execvp(shll, varg);
	return shll;
}

int main(int argc, char ** argv)
{
#if DEBUGEXEC
	debugexec("main", argc, argv);
#endif
#if !defined(TRACEABLE)
	untraceable(argv[0]);
#endif
	argv[1] = xsh(argc, argv);
	fprintf(stderr, "%s%s%s: %s\n", argv[0],
		errno ? ": " : "",
		errno ? strerror(errno) : "",
		argv[1] ? argv[1] : "<null>"
	);
	return 1;
}
