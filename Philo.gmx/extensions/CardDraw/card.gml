#define init_game
	_players = argument[0];
	global.player = _players;
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
		_deck.deck[i] = "D";
		_deck.deck[i+_deck.distillation] = "I";
		_deck.deck[i+_deck.distillation+_deck.incineration] = "T";
	}
	
	// initialize the face up cards
	for(q=0;q<=2;q++){
		draw_card(_deck);
		_deck.face_up[q] = _deck.drawn_card;		
	}
	
	return true
	
	
#define init_element_deck
	_deck = argument[0];
	
	switch(global.player)
		{
		case 2: global.basic=6;global.philo=2;break;
		case 3: global.basic=7;global.philo=3;break;
		case 4: global.basic=8;global.philo=4;break;
		}
	
	// Initialize the deck
	for(i=0;i<global.basic;i++){
		_deck.deck[i] = "ARSENIC";
		_deck.deck[i+global.basic] = "MAGNESIUM";
		_deck.deck[i+global.basic*2] = "SULFUR";
		_deck.deck[i+global.basic*3] = "ZINC";
		_deck.deck[i+global.basic*4] = "AIR";
		_deck.deck[i+global.basic*5] = "EARTH";
		_deck.deck[i+global.basic*6] = "FIRE";
		_deck.deck[i+global.basic*7] = "WATER";
	}
	count = global.basic*8 - 1;
	for(i=0;i<global.philo;i++){
		_deck.deck[i+count] = "PHILO";
	}
	_deck.card_count = count + global.philo;
	
	// Initialize the face up cards
	for(l=0;l<=2;l++){
		draw_card(_deck);
		_deck.face_up[l] = _deck.drawn_card;
	}
	
	return true;

#define select_face_up
	_choice = argument[0];
	_player = argument[1];
	_deck = argument[2];
	
	ds_list_add(_player.hand,  _deck.face_up[_choice]);
	_player.hand_size += 1;
	
	
	draw_card(_deck);
	
	_deck.face_up[_choice] = _deck.drawn_card;
	
	return true;
	
#define discard_card
	_discard = argument[0];
	_card = argument[1];
	
	return false;

#define add_process_to_hand
	_player = argument[0];
	
	draw_card(obj_process_deck);
	ds_list_add(_player.hand, obj_process_deck.drawn_card);
	_player.hand_size += 1;
	
	return true;

#define add_element_to_hand
	_player = argument[0];
	
	draw_card(obj_element_deck);
	ds_list_add(_player.hand, obj_element_deck.drawn_card);
	_player.hand_size += 1;
	
	return true;

#define draw_card
	_deck = argument[0];
	i = "none";
	selected = false;
	while(selected == false){
		r = irandom_range(0,_deck.card_count-1);
		i = _deck.deck[r];
		if(i != "none"){
			selected = true;
			_deck.deck[r] = "none";
		}
	}
	_deck.drawn_card = i;
	
	return true;