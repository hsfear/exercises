;
document.getElementsByTagName("a")[0].onclick = function() {
    this.innerHTML = "Baby, I've changed!";
    this.className +=  "error";
    return false;
}   
