
	.include	"atari.inc"

	.import	_close, pushax, popax
        .import         findfreeiocb
        .import         __do_oserror
        .import         fddecusage
        .import         fdtoiocb
        .import         __inviocb
        .import         clriocb
        .import         newfd

	.export	atari_ser_libref

.rodata

atari_ser_libref:
	.word	newfd
	.word	_close
	.word	pushax
	.word	popax
        .word   findfreeiocb
        .word   __do_oserror
        .word   fddecusage
        .word   fdtoiocb
        .word   __inviocb
        .word   clriocb
	.word	CIOV
