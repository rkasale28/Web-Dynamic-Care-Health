## HealthCare Project

> Designed and developed a web application, named HealthCare Project,for providing hassle-free diagnostics and consultation to patients. This web application was developed using JSP technology, along with mySQL as database. This application would simplify the work of doctors, and also assist patients for reaching out to experts for diagnostics and consultation.

### Significance:
- The app has three types of users:
  - Patients
  - Doctors
  - Admin
- Patients can:
  - Input, view and update details such as height, weight, blood group, family history, allergy history and major illness
  - Input, view and update emergency contacts
  - Book appointments for diagnostics and consultation with doctors
  - View appointment history
  - Cancel booked appointments
  - Reschedule booked appointments
  - View reports' soft copy
- Doctors can:
  - Schedule appointments
  - Cancel booked appointments
  - View appointment schedule
  - View the patients' history, patients' emergency contacts as well as the patients' reports, if necessary for diagnosis
  - Fill in a form which requires the prescriptions and the conclusion. The report will then be auto-generated by the system
- Admin can verify the doctors

### Implementation Details
- This web application was developed using JSP technology
- This software used mySQL as database
- itextPDF is used for generating reports in form of PDF from forms
- Mailer servlet is used for mailing purposes
- ServletOutputStream is used for displaying PDFs
- InputStream is used for retrieving PDFs from database 
