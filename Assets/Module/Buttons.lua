function ButtonNew(text, func, Color)
    return  {
        text = text,
        func = func,
        Now = false,
        Last = false,
        Color = Color
    }
end

return ButtonNew
