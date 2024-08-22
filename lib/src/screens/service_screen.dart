import 'package:flutter/material.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  AddServiceScreenState createState() => AddServiceScreenState();
}

class AddServiceScreenState extends State<AddServiceScreen> {
  String? selectedService;
  // ignore: unused_field
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final Map<String, List<String>> salonServices = {
    'Hair Services': [
      'Haircuts', 'Hair Coloring', 'Hair Treatments', 'Styling',
      'Extensions and Weaves', 'Scalp Treatments',
      'Manicure', 'Pedicure', 'Nail Art', 'Nail Extensions',
      'Facials', 'Waxing', 'Threading', 'Microdermabrasion', 'Chemical Peels',
      'Massage', 'Body Scrubs', 'Body Wraps',
      'Everyday Makeup', 'Bridal Makeup', 'Special Occasion Makeup',
      'Eyebrow and Eyelash Tinting', 'Eyelash Extensions', 'Tanning',
      'Haircuts', 'Beard Services', 'Shaving Services',
      'Hair Treatments', 'Additional Services',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Catelog', style: TextStyle(color: Colors.white)),
             backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Handle save action
            },
            child: const Text('SAVE', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImagePicker(),
            const SizedBox(height: 16),
            _buildDropdown(),
            const SizedBox(height: 16),
            _buildTextField('Price \$ (Optional)', _priceController, TextInputType.number),
            const SizedBox(height: 16),
            _buildTextField('Description', _descriptionController, TextInputType.multiline,),
            const SizedBox(height: 16),
            _buildTextField('Link', null),
            const SizedBox(height: 16),
            _buildTextField('Phone', null),
            const SizedBox(height: 16),
            _buildTextField('Product or service code', null),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(Icons.add_a_photo, size: 50, color: Colors.grey[600]),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            border: InputBorder.none,
          ),
          hint: const Text('Select Service'),
          value: selectedService,
          items: salonServices.entries.expand((category) {
            return [
              DropdownMenuItem<String>(
                value: category.key,
                enabled: false,
                child: Text(category.key, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              ...category.value.map((service) => DropdownMenuItem<String>(
                value: service,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(service),
                ),
              )),
            ];
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedService = newValue;
            });
          },
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController? controller, [TextInputType? keyboardType, int maxLines = 1]) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }
}