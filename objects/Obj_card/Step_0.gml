/// @description Insert description here
// You can write your code in this editor


if(facedown){
	sprite_index = Spr_back;
}else{
	if(card_type == CARD_TYPE_ROCK)
	{
		sprite_index = Spr_rock;
	}else if(card_type == CARD_TYPE_PAPER)
	{
		sprite_index = Spr_paper;
	}else if(card_type == CARD_TYPE_SCISSOR)
	{
		sprite_index = Spr_scissor;
	}
}

x = lerp(x,target_x,0.1);
y = lerp(y,target_y, 0.1);

