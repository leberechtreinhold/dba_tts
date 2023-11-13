armies = {}

require "scripts\\data\\data_armies_book_I"
require "scripts\\data\\data_armies_book_II"
require "scripts\\data\\data_armies_book_III"
require "scripts\\data\\data_armies_book_IV"

local function str_split(delimiter, str)
    assert(type(delimiter) == "string")
    assert(#delimiter > 0, "Must provide non empty delimiter")

    -- Add escape characters if delimiter requires it
    delimiter = delimiter:gsub("[%(%)%.%%%+%-%*%?%[%]%^%$]", "%%%0")

    local start_index = 1
    local result = {}

    while true do
       local delimiter_index, _ = str:find(delimiter, start_index)

       if delimiter_index == nil then
          table.insert(result, str:sub(start_index))
          break
       end

       table.insert(result, str:sub(start_index, delimiter_index - 1))

       start_index = delimiter_index + 1
    end

    return result
end

ordered_lists = {}
for list_name, list_data in pairs(armies['Book I']) do
    id = str_split(' ', list_name)[1]
    table.insert(ordered_lists, {book = 1, num = string.sub(id,3), data =  list_data['data']['list']})
end

for list_name, list_data in pairs(armies['Book II']) do
    id = str_split(' ', list_name)[1]
    table.insert(ordered_lists, {book = 2, num = string.sub(id,4), data =  list_data['data']['list']})
end

for list_name, list_data in pairs(armies['Book III']) do
    id = str_split(' ', list_name)[1]
    table.insert(ordered_lists, {book = 3, num = string.sub(id,5), data =  list_data['data']['list']})
end

for list_name, list_data in pairs(armies['Book IV']) do
    id = str_split(' ', list_name)[1]
    table.insert(ordered_lists, {book = 4, num = string.sub(id,4), data =  list_data['data']['list']})
end

table.sort(ordered_lists, function(a,b)
    n_a = tonumber(a.num:gsub("%D+", ""), 10)
    l_a = a.num:gsub("%A+", "")
    n_b = tonumber(b.num:gsub("%D+", ""), 10)
    l_b = b.num:gsub("%A+", "")
    if a.book ~= b.book then
        return a.book < b.book
    end
    if n_a == n_b then
        return l_a < l_b
    end
    return n_a < n_b
end)

f = io.open('lists.txt', "w")
for _,list_data in ipairs(ordered_lists) do 
    s = ""
    if list_data.book == 1 then
        s = s .. "I/"
    elseif list_data.book == 2 then
        s = s .. "II/"
    elseif list_data.book == 3 then
        s = s .. "III/"
    elseif list_data.book == 4 then
        s = s .. "IV/"
    end
    s = s .. list_data.num  .. ": " .. list_data.data .. "\n"
    f:write(s)
end
f:close()