#define init_game
	_players = argument[0];
	global.player = _players;
	switch(_players)
		{
		case 2: global.basic=6;global.philo=2;break;
		case 3: global.basic=7;global.philo=3;break;
		case 4: global.basic=8;global.philo=4;break;
		}
	_element_deck = instance_create(0,0, obj_element_deck);
	_process_deck = instance_create(0,0, obj_process_deck);
	
	return true;
	
#define init_process_deck
	_deck = argument[0];
	
	switch(global.player)
		{
		case 2: _deck.distillation=10;_deck.incineration=10;_deck.transformation=10;card_count=30;break;
		case 3: _deck.distillation=11;_deck.incineration=11;_deck.transformation=11;card_count=30;break;
		case 4: _deck.distillation=12;_deck.incineration=12;_deck.transformation=12;card_count=30;break;
		}
	
	for(i=0;i<_deck.distillation;i++){
		deck[i] = "D";
		deck[i+_deck.distillation] = "I";
		deck[i+_deck.distillation+_deck.incineration] = "T";
	}
	
	return true
	
	
#define init_element_face_up
	_deck = argument[0];
	
	for(i=0;i<3;i++){
		draw_element_card(_deck);
		_deck.face_up[i] = _deck.drawn_card;
	}
	
	return true;

#define select_element_face_up
	_choice = argument[0];
	_player = argument[1];
	_deck = obj_element_deck;
	
	_player.hand[_player.hand_size] = _deck.face_up[_choice];
	_player.hand_size += 1;
	
	
	draw_element_card(obj_element_deck);
	_deck.face_up[_choice] = _deck.drawn_card;
	
	return true;
	
	
	
#define discard_card
	_discard = argument[0];
	_card = argument[1];
	
	return false;

#define add_process_to_hand
	_player = argument[0];
	
	draw_process_card(obj_process_deck);
	_player.hand[_player.hand_size] = obj_process_deck.drawn_card;
	_player.hand_size += 1;
	
	return true;

#define add_element_to_hand
	_player = argument[0];
	
	draw_element_card(obj_element_deck);
	_player.hand[_player.hand_size] = obj_element_deck.drawn_card;
	_player.hand_size += 1;
	
	return true;

#define draw_process_card
	_deck = argument[0];
	i = "none";
	while(i == "none"){
		r = irandom_range(0,_deck.card_count-1);
		i = _deck.deck[r];
	}
	_deck.drawn_card = i;
	
	return true;
	
#define draw_element_card
	_deck = argument[0]
	
	if(_deck.card_count > 0 )
	{
		if(_deck.philosopher > 0){
			if(irandom_range(1,_deck.card_count)>=_deck.card_count){
				_deck.philosopher-=1;
				card_count -= 1;
				_deck.drawn_card = "PHILO";
				return true;
			}
		}
		card = irandom_range(1,_deck.card_count);
		if(card >=1 && card <=1+_deck.cards[0]){
			_deck.cards[0] -= 1;
			_deck.drawn_card = "ARSENIC";
			_deck.card_count -= 1;
			return true;
		}else if(card >= 1+_deck.cards[0] && card <= 1+_deck.cards[0]+_deck.cards[1]){
			_deck.cards[1] -= 1;
			_deck.drawn_card = "MAGNESIUM";
			_deck.card_count -= 1;
			return true;
		}else if(card >= 1+_deck.cards[0]+_deck.cards[1] && card <= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]){
			_deck.cards[2] -= 1;
			_deck.drawn_card = "SULFUR";
			_deck.card_count -= 1;
			return true;
		}else if(card >= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2] && card <= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]){
			_deck.cards[3] -= 1;
			_deck.drawn_card = "ZINC";
			_deck.card_count -= 1;
			return true;
		}else if(card >= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3] && card <= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]+_deck.cards[4]){
			_deck.cards[4] -= 1;
			_deck.drawn_card = "AIR";
			_deck.card_count -= 1;
			return true;
		}else if(card >= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]+_deck.cards[4] && card <= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]+_deck.cards[4]+_deck.cards[5]){
			_deck.cards[5] -= 1;
			_deck.drawn_card = "EARTH";
			_deck.card_count -= 1;
			return true;
		}else if(card >= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]+_deck.cards[4]+_deck.cards[5] && card <= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]+_deck.cards[4]+_deck.cards[5]+_deck.cards[6]){
			_deck.cards[6] -= 1;
			_deck.drawn_card = "FIRE";
			_deck.card_count -= 1;
			return true;
		}else if(card >= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]+_deck.cards[4]+_deck.cards[5]+_deck.cards[6] && card <= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]+_deck.cards[4]+_deck.cards[5]+_deck.cards[6]+_deck.cards[7]){
			_deck.cards[7] -= 1;
			_deck.drawn_card = "WATER";
			_deck.card_count -= 1;
			return true;
		}
	}