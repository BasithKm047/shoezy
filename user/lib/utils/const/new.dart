// class TrieNode {
//   Map<String, TrieNode> children = {};
//   bool isEndofWord = false;
// }

// class Trie {
//   TrieNode root = TrieNode();

//   insert(String word) {
//     TrieNode node = root;

//     for (int i = 0; i < word.length; i++) {
//       String char = word[i];
//       node = node.children.putIfAbsent(char, () => TrieNode());
//     }
//     node.isEndofWord = true;
//   }

//   search(String word) {
//     TrieNode node = root;
//     for (int i = 0; i < word.length; i++) {
//       String char = word[i];
//       if (!node.children.containsKey(char)) return false;
//       node = node.children[char]!;
//     }
//     return node.isEndofWord;
//   }

//   prefix(String prefix) {
//     TrieNode node = root;
//     for (int i = 0; i < prefix.length; i++) {
//       String char = prefix[i];
//       if (!node.children.containsKey(char)) return false;
//       node = node.children[char]!;
//     }
//     return true;
//   }

//   autoComplete(String prefix) {
//     TrieNode node=root;
//     List<String> results=[];
//     for(int i=0;i<prefix.length;i++){
//       String char=prefix[i];
//       if(!node.children.containsKey(char)) return [];
//       node =node.children[char]!;

//     }
//     dfs(results, node, prefix);
//     return results;

//   }

//   dfs(List<String>result, TrieNode node, String prefix){
//     if(node.isEndofWord){
//       result.add(prefix);
//     }
//   for(String ch in node.children.keys){
//     dfs(result, node.children[ch]!, prefix+ch);
//   }

//   }
// }
 
//  class Graph{
//   Map<String , List<String>>adj={};


//   addEdge(String v, String u){
//     adj[v]??=[];
//     adj[u]??=[];
//     adj[u]!.add(v);
//     adj[v]!.add(u);
//   }
//   bfs(String start){
//     Set<String>visited={};
//     List<String>queue=[];
//     visited.add(start);
//     queue.add(start);

//     while(queue.isNotEmpty){
//       String node=queue.removeAt(0);
//       print(node);
//       for(String n in adj[node]??[]){
//         if(!visited.contains(n)){
//           visited.add(n);
//           queue.add(n);
//         }
//       }
//     }
//   }

//   dfs(String start){
//     Set<String>visited={};
//     visited.add(start);
//     print(start);

//     for(String n in adj[start]??[]){
//       if(!visited.contains(n)){
//         dfs(n);
//       }
//       }
//     }

//  }

// class Node{
//   int value;
//   Node? left;
//   Node? right;
//   Node(this.value);
// }

// class Bst{
//   Node ? root;
// Node? insert(Node? node, int value){
//    if(node==null) return Node(value);
//       if(value<node.value){
//         node.left=insert(node.left, value);
//       }else{
//         node.right=insert(node.right, value);
//       }
//       return node;
//   }

//   add(int value){
//     root=insert(root, value);
//   }

//   delete(Node? node, int key){
//     if(node==null) return null;
//     if(key<node.value){
//       node.left=delete(node.left, key);
//     }else if(key>node.value){
//       node.right=delete(node.right, key);
//     }else{
//       if(node.right==null) {
//         return node.left;
//       } else if(node.left==null){
//         return node.right;
//       }
//        node.value=minVal(node.right);
//        node.right=delete(node.right, node.value);

//     }
//   }

//   minVal(Node? node){
//     while(node!.left!=null){
//       node=node.left;
//     }
//     return node.value;
//   }

//   inorder(Node? node){
//     if(node!=null){
//       inorder(node.left);
//       print(node.value);
//       inorder(node.right);
//     }
//   }
// }


// class HashTable{
//   List<List<Entry>>? buckets;
//   int size;

//   HashTable(this.size) {
//     buckets = List.generate(size, (_) => []);
//   }

//   int _hash(String key) {
//     return key.hashCode % size;
//   }

//   void insert(String key, dynamic value) {
//     int index = _hash(key);
//     List<Entry> bucket = buckets![index];

//     for (var entry in bucket) {
//       if (entry.key == key) {
//         entry.value = value;
//         return;
//       }
//     }
//     bucket.add(Entry(key, value));
//   }

//   dynamic get(String key) {
//     int index = _hash(key);
//     List<Entry> bucket = buckets![index];

//     for (var entry in bucket) {
//       if (entry.key == key) {
//         return entry.value;
//       }
//     }
//     return null;
//   }

//   void remove(String key) {
//     int index = _hash(key);
//     List<Entry> bucket = buckets![index];

//     bucket.removeWhere((entry) => entry.key == key);
//   }
// }

// class Entry {
//   String key;
//   dynamic value;

//   Entry(this.key, this.value);

// }


void main(List<String> args) {

  // var list= linkedList.convertIntoList(linkedList.head);
  // print(linkedList.head!.data);
  // print(list);

 Tree1 tree1=Tree1();
 tree1.add(1);
 tree1.add(2);
 tree1.add(3);

 Tree2 tree2=Tree2();

 tree2.add(1);
 tree2.add(2);
 tree2.add(4);

 print(identical(tree1.root, tree2.root));

}


// class Node{
//   int data;

// Node? next;
// Node(this.data);

// }



// class LinkedList{
//   Node? head;
//  add(int value){

//   if (head==null){
//     head=Node(value);
//     return;
//   }

//   Node? node=head;
//   while(node!.next!=null){
//     node=node.next;
//   }
//   node.next=node;
//  }


//  List<int> convertIntoList(Node ? node){
//   List<int>list=[];
//   while(node!=null){
//     list.add(node.data);
//   }
//   return list;
//  }



// }




class Node{
  int data;
  Node ? left;
  Node ? right;
  Node(this.data);
} 


class Tree1{

Node? root;

 add(int value){
  root=insert(root, value);
 }
insert(Node? node, int value){
  if(node==null) return Node(value);

  if(value<node.data){
    node.left=insert(node.left, value);
  }else{
    node.right=insert(node.right, value);
  }
  return node;
}

}



class Tree2{

Node? root;

 add(int value){
  root=insert(root, value);
 }
insert(Node? node, int value){
  if(node==null) return Node(value);

  if(value<node.data){
    node.left=insert(node.left, value);
  }else{
    node.right=insert(node.right, value);
  }
  return node;
}

}


identical(Node? tree1 ,Node? tree2){
  if(tree1==null && tree2 ==null) return false;

  // if(tree1!.data==tree2!.data) return true;

  return identical(tree1!.left, tree2!.left)&& identical(tree1.right, tree2.right);
}

