class Vacancy {
  final String jobID, title;
  final String? company,
      location,
      description,
      longDescription,
      salary,
      datePosted,
      image;

  Vacancy(
      {required this.jobID,
      required this.title,
      this.company,
      this.location,
      this.description,
      this.longDescription,
      this.salary,
      this.datePosted,
      this.image});

  factory Vacancy.fromJson(final Map<String, dynamic> json) {
    return Vacancy(
        jobID: json['job_id'],
        title: json['title'],
        company: json['company'],
        location: json['location'],
        description: json['description'],
        longDescription: json['long_description'],
        salary: json['salary'],
        datePosted: json['date_posted'],
        image: json['image_url']);
  }
}
