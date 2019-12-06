let ignoreBracket = "[]";
let selected, cypher;

$().ready(() => initialize());

function initialize() {
    selectCypher(Object.keys(cyphers)[0]);
    initializeNav();
    addInputListeners();
}

function selectCypher(name) {
    if(name) {
        selected = name;
        cypher = cyphers[selected];
        $('#out .title').html(selected);
        generateAlphabet();
        updateText(); 
    }
}

function addInputListeners() {
    $('#in .input').on('keyup', () => updateText('out'));
    $('#out .input').on('keyup', () => updateText('in'));

    $('#save').on('click', (event) => saveCypher(event));
    $('#upload').on('click', (event) => uploadCypher(event));
    $('#download').on('click', (event) => downloadCypher(event));
}

function initializeNav() {
    for(let c in cyphers) {
        $('nav').append(
            $('<label class=select>').css({
                'background-color': '#' + getColourFromString(c)
            }).append(
                $('<input type=radio name=cypher value="' + c + '">')
            ).append(c)
        );
    }

    $('input[type=radio][name=cypher]').change(function() {
        if(selected != this.value) {
            selectCypher(this.value);
            updateOpacity();
        }
    });

    updateOpacity();
}

function getColourFromString(str) {
    let hash = 0;
    for (var i = 0; i < str.length; i++) {
       hash = str.charCodeAt(i) + ((hash << 5) - hash);
    }

    let c = (hash & 0x00FFFF).toString(12).toUpperCase();
    return "00000".substring(0, 6 - c.length) + c;
}

function updateOpacity() {
    $('.select').each(function() {
        let input = $(this).children()[0];
        if(input.value === selected) input.checked = true;
        this.style.opacity = ($(this).children()[0].checked) ? 1.0 : 0.8;
    });
}

function generateAlphabet() {
    let form = $('.alphabet-section').empty();
    for(let letter in cypher) {
        form.append(
            $('<label class=letter>').append(letter).append(
                $('<input name=' + letter + '>').val(cypher[letter])
            ).on('keyup', (event) => changeCypher(event))
        );
    }
}

function flipObjectValues(obj) {
    let flipped = {}
    for(let key in obj) flipped[obj[key]] = key;
    return flipped;
}

function changeCypher(event) {
    if(event.currentTarget.classList.contains('letter')) {
        cypher[event.target.name] = event.target.value;
    }
    updateText();
}

function objectsAreEqual(a, b) {
    let initialValues = Object.keys(cyphers[selected]),
        currentValues = Object.keys(cypher);

    if(initialValues.length !== currentValues.length) {
        return false;
    } else {
        for(let key in initialValues) {
            if(initialValues[key] !== currentValues.length) return false;
        }
    }

    return true;
}

function updateText(field = 'out') {
    if(field === 'out') {
        $('#out .input').val(translate($('#in .input').val(), cypher));
    } else {
        $('#in .input').val(translate($('#out .input').val(), flipObjectValues(cypher)));
    }
}

function translate(text, cypher) {
    let ignore = false;
    let translated = "";
    for(let i = 0; i < text.length; i++) {
        let c = text[i];
        let upper = !$.isNumeric(c) && c == c.toUpperCase();
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

const cyphers = {
    "Al Bhed": {
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
        "a":"4",
        "b":"8",
        "c":"(",
        "d":"|)",
        "e":"3",
        "f":"ph",
        "g":"6",
        "h":"|-|",
        "i":"!",
        "j":"j",
        "k":"|<",
        "l":"1",
        "m":"^^",
        "n":"|\\|",
        "o":"0",
        "p":"P",
        "q":"kw",
        "r":"l2",
        "s":"$",
        "t":"7",
        "u":"|_|",
        "v":"V",
        "w":"\\/\\/",
        "x":"><",
        "y":"'/",
        "z":"2"
    }
}

function saveCypher(event) {
    
    
}

function uploadCypher(event) {
    console.log(event);
}

function downloadCypher(event, name = 'cypher.json', all = false) {
    let form = $('.letter input'); 
    let mapped = {}; 
    for(let key in form) mapped[form[key]['name']] = form[key]['value'];

    const a = document.createElement('a');
    a.href = URL.createObjectURL(new Blob([JSON.stringify(mapped)], { type:'text/json' }));
    a.download = name;
    a.click();
}
