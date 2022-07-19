import 'package:cardapp/src/core/model/card_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final cardRef = _firestore.collection('card').withConverter<CardModel>(
        fromFirestore: (snapshot, _) =>
            CardModel.fromJSON(snapshot.data() as Map<String, dynamic>),
        toFirestore: (card, _) => card.toJSON(),
      );

  Future<CardModel> getCard(String? id) async {
    final snapshot = await cardRef.doc(id).get();
    return CardModel.fromJSON(snapshot.data() as Map<String, dynamic>);
  }

  static Future<List<dynamic>> getCards() async {
    try {
      final cards = await cardRef.get();
      // print(cards);
      return cards.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      // print(e);
      return [];
    }
  }

  Future addCard(CardModel card) async {
    final docRef = await cardRef.add(card);
    return await cardRef.doc(docRef.id).update({'id': docRef.id});
  }

  Future<CardModel> updateCard(CardModel card) async {
    await cardRef.doc(card.id).update(card.toJSON());
    return await getCard(card.id);
  }

  Future<void> deleteCard(String? id) async {
    await cardRef.doc(id).delete();
  }
}
