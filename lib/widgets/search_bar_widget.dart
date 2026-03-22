class SearchBarWidget extends StatelessWidget {
  final String placeholder;
  final Function(String) onSearch;

  SearchBarWidget({required this.placeholder, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        onSubmitted: onSearch,
        decoration: InputDecoration(
          hintText: placeholder,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}