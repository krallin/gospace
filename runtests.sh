#!/bin/bash

TEST_DIR=_gospace_tests

_GOSPACE_HOME=$TEST_DIR
source gospace

TEST_PATH="/bin"
TEST_GOPATH="/test/gopath"
TEST_GOSPACE="testspace"


PATH=$TEST_PATH
GOPATH=$TEST_GOPATH


test_enter_exit () {
  # Test that we set PATH and GOPATH when entering a workspace
  _gospace_enter $TEST_GOSPACE

  EXPECTED_PATH=$TEST_DIR/$TEST_GOSPACE/bin:/bin
  if [ "$PATH" != "$EXPECTED_PATH" ] ; then
    echo "ERROR: PATH was not set properly"
    echo "Expected: $EXPECTED_PATH"
    echo "Received: $PATH"
    exit 1
  fi

  EXPECTED_GOPATH=$TEST_DIR/$TEST_GOSPACE
  if [ "$GOPATH" != "$EXPECTED_GOPATH" ] ; then
    echo "ERROR: GOPATH was not set properly"
    echo "Expected: $EXPECTED_GOPATH"
    echo "Received: $GOPATH"
    exit 1
  fi

  # Test that we create GOPATH when entering a workspace
  if [ ! -d "$GOPATH" ] ; then
    echo "ERROR: GOPATH was not created"
    exit 1
  fi

  # Test that we restore PATH and GOPATH when exiting a workspace
  _gospace_exit
  if [ "$PATH" != "$TEST_PATH" ] ; then
    echo "ERROR: PATH was not restored properly"
    echo "Expected: $TEST_PATH"
    echo "Received: $PATH"
    exit 1
  fi

  if [ "$GOPATH" != "$TEST_GOPATH" ] ; then
    echo "ERROR: GOPATH was not restored properly"
    echo "Expected: $TEST_GOPATH"
    echo "Received: $GOPATH"
    exit 1
  fi
}

echo "Testing enter-exit workflow"
test_enter_exit

echo "Testing enter-enter-exit workflow"
_gospace_enter other_space
test_enter_exit


echo "All tests passed!"
