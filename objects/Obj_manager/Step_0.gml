/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码 

//卡牌初始位置
card_x = 100;
card_y = room_height/2;

//定义初始
if (game_state == STATE_DEAL_CARDSTACK) {
	 player_card_i = 0;
	 n = 0;
	 ds_list_clear(discard_pile);
	 ds_list_shuffle(cards);
	
	for(i = 0;i < num_cards; i++) {
		
		cards[|i].target_x = card_x;
		cards[|i].target_y = card_y - i*2;
		cards[|i].facedown = true;
		cards[|i].depth = -i;
		cards[|i].card_holder = ch_ai;
		
	}
	 
	
	//判定当前游戏阶段，若应进入下一个state，开始倒计时，倒计时结束进入下一个state
	if (!waiting_for_alarm) {
		game_state = -4;
		alarm[0] = 2 * room_speed;
		show_debug_message("state deal cardstack ends");
		//waiting_for_alarm = true;
	}
		
	 //game_state = STATE_DEAL_CARDS_AI;
}

if (game_state == STATE_DEAL_CARDS_AI) {
	
	num_ai_card = 3;
	num_player_card = 3;
	ai_x = 300;
	ai_y = 300;
	//show_debug_message("ai deal a cards");


	if(timer < 70){
		timer ++;
	}

	if(ds_list_size(ai_cards) < 3 and timer == 20){
		
		show_debug_message("you deal a card");
		cards[|num_cards - 1].target_x = ai_x + ai_card_i * 100;
		cards[|num_cards - 1].target_y = ai_y;
		cards[|num_cards - 1].facedown = true;
		cards[|num_cards - 1].card_holder = ch_ai;
		//effect_create_below(ef_flare,cards[|num_cards - 1].target_x, cards[|num_cards - 1].target_y, 1, c_yellow);
		
		ds_list_add(ai_cards,cards[|num_cards - 1]);		
		ds_list_delete(cards, num_cards - 1);
		show_debug_message("1 you deal a card");
		timer = 0;
		num_cards -=1;
		ai_card_i +=1;
	}
	
	
	waiting_for_alarm = true;
	
	if (waiting_for_alarm and ds_list_size(ai_cards) ==3) {
		game_state = -4;
		alarm[1] = 1 * room_speed;
		show_debug_message("state deal cards AI ends");
		//waiting_for_alarm = false;
	} 
	//game_state = STATE_DEAL_CARDS_PLAYER;
}







