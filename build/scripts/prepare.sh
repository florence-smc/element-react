#!/bin/bash

# testing before publish
npm run lint && npm run build && npm run test

if [ $? = 0 ]; then
  # purge dist
  rm -fr dist

  # babel transform es6 into es5
  babel src --out-dir dist/npm/src --copy-files
  babel libs --out-dir dist/npm/libs --copy-files
  babel build/npm/index.js --out-file dist/npm/index.js

  # keep es6 for next.js
  cp build/npm/index.js next.js
else
  echo 'Code cant be verify, plz check ~'
fi
