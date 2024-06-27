import std.stdio;
import std.json;
import requests;
import std.string;

void main() {
    while (true) {
        write("you>: ");
        string userInput = stdin.readln().strip();
        
        if (userInput == "exit" || userInput == "quit" || userInput == "murtad") {
            break;
        }

        auto content = postContent("https://api.simsimi.vn/v1/simtalk", queryParams("text", userInput, "lc", "id"));
        string responseString = content.toString();
        JSONValue jsonResponse = parseJSON(responseString);
        
        writeln("bot>: ", jsonResponse["message"].str);
    }
}
