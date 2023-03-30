function formatTitleOne(str) {
    let firstLetter = str[0].toUpperCase()
    let remaining = str.slice(1, str.length)
    str = firstLetter + remaining.toLowerCase()
    return str
}

console.log(formatTitleOne('cycas revoluta'))