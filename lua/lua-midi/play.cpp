extern "C"
{
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
}

#include "RtMidi.h"

static RtMidiOut midi;


int midi_send(lua_State *L) {
    double status = lua_tonumber(L, -3);
    double data1 = lua_tonumber(L, -2);
    double data2 = lua_tonumber(L, -1);
    std::vector<unsigned char> message(3);
    message[0] = static_cast<unsigned char>(status);
    message[1] = static_cast<unsigned char>(data1);
    message[2] = static_cast<unsigned char>(data2);
    midi.sendMessage(&message);
    return 0;
}

int main(int argc, const char *argv[]) {
    printf("hello\n");
    if (argc < 1) { return -1; }
    unsigned int ports = midi.getPortCount();
    printf("%s: %i\n", "Port", ports);
    if (ports < 1) { return -1; }
    midi.openPort(0);
    printf("world\n");
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);
    lua_pushcfunction(L, midi_send);
    lua_setglobal(L, "midi_send");
    luaL_dofile(L, argv[1]);

    lua_close(L);
    return 0;
}

