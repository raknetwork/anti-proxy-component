
#include <open.mp>

/*
 * proxy_whitelist_ip - Check if received ip from gamemode is in whitelisted pool
 * @param arg_player_id: Your player id (used in debug mode to see in console which player id used this command)
 * @param arg_player_ip: Player ip (This player ip is used to bypass anti-proxy api request)
 * 
 * This function allow samp owners to whitelist a player who is connected with a proxy/vpn connection 
 * That means this component is completly bypassed on ClientJoin(RPC:25)
 * 
 * Return: - 0 if player_ip is already in whitelisted_ip_pool
 *         - 1 if player_ip was added in whitelisted_ip_pool
*/
native proxy_whitelist_ip(arg_player_id, const client_ip[]);


/*
 * proxy_get_response_state - Check for player proxy request state
 * @param arg_player_id: Player id (used to get the proxy request state of the player) 
 * 
 * This function allow samp owners to get proxy request state from a player id
 * 
 * Return: - 0 if player is not nonnected
 *         - 1 for invalid request response handler
 *         - 2 for invalid request response status_code != 200
 *         - 3 for invalid request response json parsing
 *         - 4 if request response json 'have_errors' field is true 
 *         - 5 if state is now a success
*/
native proxy_get_response_state(arg_player_id);


/*
 * proxy_is_player_a_threat - Check if player is connected with a proxy/vpn connection
 * @param arg_player_i: Player id (used to check if player is using a proxy/vpn connection)
 * 
 * This function allow samp owners to check if a player is using a proxy/vpn connection.
 * 
 * Return: - 0 if a player is not using proxy/vpn
 *         - 1 if a player is using a proxy/vpn connection
*/
native proxy_is_player_a_threat(arg_player_id);

// Define the dialog IDs either with an enum:
enum
{
    DIALOG_NULL,
    DIALOG_LOGIN,
    DIALOG_WELCOME,
    DIALOG_WEAPONS
}

// Alternatively, using macros:
#define DIALOG_PROXYCHECK_IP 1
#define DIALOG_WHITELISTED_IP 2

main()
{
}

public OnGameModeInit()
{
    return 1;
}


public OnPlayerSpawn(playerid)
{
    ShowPlayerDialog(playerid, DIALOG_PROXYCHECK_IP, DIALOG_STYLE_MSGBOX, "ProxyCheckComponent", "Check if your ip is a vpn/proxy", "Ok", "Cancel");
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{


    if (dialogid == DIALOG_PROXYCHECK_IP)
    {
        new player_name[MAX_PLAYER_NAME + 1];
        GetPlayerName(playerid, player_name, sizeof(player_name));
        
        new is_proxy;
        is_proxy = proxy_is_player_a_threat(playerid);
        
        new request_state;
        request_state = proxy_get_response_state(playerid);
        

        /* Proxy detected */
        if (is_proxy && request_state == 5)
        {
            new string[144];
            format(string, sizeof (string), "%s[%d], is_proxy: %d, state: %d\n", player_name, playerid, is_proxy, request_state);
            SendClientMessage(playerid, 0x00FF00FF, string);
        }


        /* Whitelist ip dialog */
        ShowPlayerDialog(playerid, DIALOG_WHITELISTED_IP, DIALOG_STYLE_INPUT, "Whitelist IP", "Here you can whitelist player ip", "Close", "Enter");
    }

    if (dialogid == DIALOG_WHITELISTED_IP)
    {

        /*  Add this custom player ip to anti-proxy-component whitelisted pool  */
        proxy_whitelist_ip(playerid, inputtext);

        new string[144];
        format(string, sizeof (string), "IP Whitelisted: %s\n", inputtext);

        SendClientMessage(playerid, 0x00FF00FF, string);
    }


    return 1;
}



