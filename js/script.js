let cypher, ignoreBracket; 

$().ready(() => {
    cypher = cyphers[Object.keys(cyphers)[0]];
    ignoreBracket = "[]"; 

    $('#input').on('keyup', (event) => {
        $('#output').val(translate(event.currentTarget.value, cypher));
    });

    $('#output').on('keyup', (event) => {
        $('#input').val(translate(event.currentTarget.value, flipObjectValues(cypher)));
    });

    generateAlphabet(cypher);
});

function translate(text, cypher) {
    let ignore = false; 
    let translated = "";
    for(let i = 0; i < text.length; i++) {
        let c = text[i];
        let upper = c == c.toUpperCase(); 
        if(ignoreBracket.includes(c)) ignore = !ignore; 

        if(ignore) {
            translated += c; 
        } else {
            if(upper) {
                translated += (cypher[c.toLowerCase()] || c).toUpperCase(); 
            } else {
                translated += (cypher[c.toLowerCase()] || c); 
            }
        }
    }
    return translated; 
}

function flipObjectValues(obj) {
    let flipped = {}
    for(let key in obj) flipped[obj[key]] = key;
    return flipped; 
}

function generateAlphabet(cypher) {
    
}

const cyphers = {
    "al bhed": {
        "a":"y",
        "b":"p",
        "c":"l",
        "d":"t",
        "e":"a",
        "f":"v",
        "g":"k",
        "h":"r",
        "i":"e",
        "j":"z",
        "k":"g",
        "l":"m",
        "m":"s",
        "n":"h",
        "o":"u",
        "p":"b",
        "q":"x",
        "r":"n",
        "s":"c",
        "t":"d",
        "u":"i",
        "v":"j",
        "w":"f",
        "x":"q",
        "y":"o",
        "z":"w"
    },
    "l33t": {

    }
}
