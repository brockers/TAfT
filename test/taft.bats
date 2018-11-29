#!/usr/bin/env bats

RUNDIR="$( pwd )"
TESTDIR="${RUNDIR}/test"
BINDIR="${TESTDIR}/bin"
SCRIPTS="${GOPATH}/bin/taft"
OLDPATH="$PATH"

# Test specific variables

teardown(){
	cd "${RUNDIR}"
	export PATH="$OLDPATH"
}

setup(){
	cd ${RUNDIR}
	rm -f "debug.log"
	export PATH="$BINDIR:$GOPATH/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin/:/usr/sbin"
}

@test "HELP: With -h argument print usage information" {
	run ${SCRIPTS} -h
	RESULT="$( ${SCRIPTS} -h 2>&1 >/dev/null |grep 'Usage of '|wc -l )"
	[ "$status" -eq 2 ]
	[ "$RESULT" -eq 1 ]
}

