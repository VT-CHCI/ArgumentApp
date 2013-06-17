#!/usr/bin/env sh
echo Uploading Industrialists Scenario JSON
curl -vH "Content-type: application/json" -X PUT --data "@scenarios/industrialists/industrialists.json" http://localhost:4567/scenario/industrialists
echo Uploading Industrialists Scenario PDFs
curl -vH 'Content-type: application/pdf' -X PUT --data-binary "@scenario/industrialists/pdfs/one.pdf" http://localhost:4567/scenario/industrialists/one.pdf
curl -vH 'Content-type: application/pdf' -X PUT --data-binary "@scenario/industrialists/pdfs/two.pdf" http://localhost:4567/scenario/industrialists/two.pdf
curl -vH 'Content-type: application/pdf' -X PUT --data-binary "@scenario/industrialists/pdfs/three.pdf" http://localhost:4567/scenario/industrialists/three.pdf
curl -vH 'Content-type: application/pdf' -X PUT --data-binary "@scenario/industrialists/pdfs/four.pdf" http://localhost:4567/scenario/industrialists/four.pdf
curl -vH 'Content-type: application/pdf' -X PUT --data-binary "@scenario/industrialists/pdfs/five.pdf" http://localhost:4567/scenario/industrialists/five.pdf
curl -vH 'Content-type: application/pdf' -X PUT --data-binary "@scenario/industrialists/pdfs/six.pdf" http://localhost:4567/scenario/industrialists/six.pdf
curl -vH 'Content-type: application/pdf' -X PUT --data-binary "@scenario/industrialists/pdfs/seven.pdf" http://localhost:4567/scenario/industrialists/seven.pdf
curl -vH 'Content-type: application/pdf' -X PUT --data-binary "@scenario/industrialists/pdfs/eight.pdf" http://localhost:4567/scenario/industrialists/eight.pdf
curl -vH 'Content-type: application/pdf' -X PUT --data-binary "@scenario/industrialists/pdfs/nine.pdf" http://localhost:4567/scenario/industrialists/nine.pdf
curl -vH 'Content-type: application/pdf' -X PUT --data-binary "@scenario/industrialists/pdfs/ten.pdf" http://localhost:4567/scenario/industrialists/ten.pdf

echo Uploading Industrialists Scenario PDFs
curl -vH "Content-type: application/json" -X --data "@users/mil.json" http://localhost:4567/user/666
