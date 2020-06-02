require 'pry'

def caesar_cypher(string,shift)
    while shift > 26 do 
        shift = shift % 26
    end
    print string, shift,"\n"*2
    lower_case_alpha = ('a'..'z').to_a 
    upper_case_alpha = ('A'..'Z').to_a
    str_array = string.split("")
    shifted_str_array = []
    str_array.each do |letter|
        if lower_case_alpha.include?(letter)
            index = lower_case_alpha.find_index(letter)
            new_index = newIndex(index,shift)
            letter = lower_case_alpha[new_index]
            shifted_str_array.push(letter)
        elsif upper_case_alpha.include?(letter)
            index = upper_case_alpha.find_index(letter)
            new_index = newIndex(index,shift)
            letter = upper_case_alpha[new_index]
            shifted_str_array.push(letter)
        else
            letter = letter 
            shifted_str_array.push(letter)
        end 

    end 
    shifted_str = shifted_str_array.join('')
    puts "This is your new encrypted message :",shifted_str 
    return shifted_str 
end 

def newIndex(index,shift)
    new_index = index + shift
    while new_index > 25 || new_index < -25 do 
        if new_index > 25
            new_index -= 26
        else 
            new_index += 26
        end
    end
    return new_index
end

puts "Please sir, write down the message you'd like to encrypt: \n"
string = gets.chomp 
puts "Now choose a number as an encrypting factor: \n"
shift =  gets.chomp.to_i 
caesar_cypher(string, shift)