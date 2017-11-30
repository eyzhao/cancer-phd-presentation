function range(start, end, step) {
  var _end = end || start;
  var _start = end ? start : 0;
  var _step = step || 1;
  return Array((_end - _start) / _step).fill(0).map((v, i) => _start + (i * _step));
}

var indices = range(1, 31, 1)
paths = indices.map(i => {
    return('publications/mutation-signature-tools/example-files/individual_signatures/Signature_' + i.toString())
})

var currentIdIndex = 0;

function switch_to(indexValue) {
    var newFilePath = paths[indexValue] + ".svg";
    var switch_element = document.getElementById("signature_figures");
    switch_element.src = newFilePath;
}

function switch_next() {
    currentIdIndex++;
    if (currentIdIndex > paths.length - 1) {
        currentIdIndex = 0;
    }
    switch_to(currentIdIndex);
}

function switch_previous() {
    currentIdIndex--;
    if (currentIdIndex < 0) {
        currentIdIndex = paths.length - 1;
    }
    switch_to(currentIdIndex);
}

