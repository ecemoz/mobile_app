const List<Map<String, Object>> cybersecurityTopicsSeed = [
  {
    'id': 'cyber-intro',
    'title': 'Introduction to Cybersecurity',
    'short_description':
        'Build a strong foundation for protecting systems and data.',
    'description':
        'Start your cybersecurity journey by learning core principles, common threats, and practical daily habits that reduce risk in both personal and professional environments.',
    'order': 1,
    'difficulty': 'Beginner',
    'estimated_lesson_count': 4,
    'icon': 'shield_rounded',
    'illustration': 'Shield over a digital grid with warning indicators.',
    'color_tag': '#D8F2FF',
  },
  {
    'id': 'cyber-cryptography-fundamentals',
    'title': 'Cryptography Fundamentals',
    'short_description': 'Understand how encryption protects confidentiality.',
    'description':
        'Learn the language of cryptography, compare symmetric and public key methods, and connect key management to real-world secure systems.',
    'order': 2,
    'difficulty': 'Beginner',
    'estimated_lesson_count': 4,
    'icon': 'key_rounded',
    'illustration': 'Key and lock icons connected by encrypted message paths.',
    'color_tag': '#E3FBE8',
  },
  {
    'id': 'cyber-integrity-signatures',
    'title': 'Message Integrity and Digital Signatures',
    'short_description':
        'Verify that messages are authentic and unchanged in transit.',
    'description':
        'Explore hashing, MACs, and digital signatures to understand how integrity and authenticity complement confidentiality in secure systems.',
    'order': 3,
    'difficulty': 'Intermediate',
    'estimated_lesson_count': 4,
    'icon': 'verified_user_rounded',
    'illustration':
        'Document with checksum stamp and signature verification badge.',
    'color_tag': '#FFF1D7',
  },
  {
    'id': 'cyber-authentication-access-control',
    'title': 'Authentication and Access Control',
    'short_description':
        'Control who can access what, and under which conditions.',
    'description':
        'Master authentication basics, password hygiene, MFA, and session protection to reduce account takeover and privilege abuse.',
    'order': 4,
    'difficulty': 'Beginner',
    'estimated_lesson_count': 4,
    'icon': 'lock_person_rounded',
    'illustration':
        'User identity card passing through a secure access gateway.',
    'color_tag': '#EDE7FF',
  },
  {
    'id': 'cyber-secure-communication-protocols',
    'title': 'Secure Communication Protocols',
    'short_description':
        'Protect data in transit with TLS, HTTPS, and certificate trust.',
    'description':
        'Understand secure transport from handshake to encrypted sessions, and why protocol choices directly impact confidentiality and trust.',
    'order': 5,
    'difficulty': 'Intermediate',
    'estimated_lesson_count': 4,
    'icon': 'https_rounded',
    'illustration':
        'Two servers exchanging encrypted packets over a locked channel.',
    'color_tag': '#DFF7F3',
  },
  {
    'id': 'cyber-network-security-vpns',
    'title': 'Network Security and VPNs',
    'short_description':
        'Secure traffic across networks with tunneling and packet protection.',
    'description':
        'Learn network defense basics, IPsec principles, VPN tunneling, and enterprise protection patterns for distributed systems.',
    'order': 6,
    'difficulty': 'Intermediate',
    'estimated_lesson_count': 4,
    'icon': 'router_rounded',
    'illustration':
        'Corporate network map with protected tunnels between locations.',
    'color_tag': '#FFE6EA',
  },
  {
    'id': 'cyber-wireless-mobile-security',
    'title': 'Wireless and Mobile Security',
    'short_description':
        'Stay safe on Wi-Fi and mobile networks with practical defense habits.',
    'description':
        'Explore wireless threat models, WPA generations, mobile risks, and safe behavior for untrusted networks and devices.',
    'order': 7,
    'difficulty': 'Intermediate',
    'estimated_lesson_count': 4,
    'icon': 'wifi_protected_setup_rounded',
    'illustration':
        'Smartphone and Wi-Fi access point with secure signal shield.',
    'color_tag': '#FFF5CC',
  },
  {
    'id': 'cyber-email-web-security',
    'title': 'E-mail and Web Security',
    'short_description':
        'Recognize phishing and browse safely with security-first habits.',
    'description':
        'Study secure email basics, phishing patterns, spoofing and spam indicators, and practical browser protections for daily work.',
    'order': 8,
    'difficulty': 'Intermediate',
    'estimated_lesson_count': 4,
    'icon': 'mark_email_read_rounded',
    'illustration':
        'Inbox and browser window with threat warnings and safe checkmarks.',
    'color_tag': '#E8F1FF',
  },
  {
    'id': 'cyber-firewalls-intrusion-detection',
    'title': 'Firewalls and Intrusion Detection',
    'short_description':
        'Build layered defenses with filtering, monitoring, and response.',
    'description':
        'Understand firewall behavior, IDS and IPS roles, and monitoring strategies that help detect and contain suspicious activity.',
    'order': 9,
    'difficulty': 'Intermediate',
    'estimated_lesson_count': 4,
    'icon': 'security_rounded',
    'illustration':
        'Security operations dashboard monitoring filtered traffic flows.',
    'color_tag': '#FDE7D9',
  },
  {
    'id': 'cyber-awareness-safe-practices',
    'title': 'Cybersecurity Awareness and Safe Practices',
    'short_description':
        'Turn security knowledge into everyday personal and team behavior.',
    'description':
        'Finish the curriculum with practical awareness skills, secure update behavior, privacy-first thinking, and long-term security hygiene.',
    'order': 10,
    'difficulty': 'Beginner',
    'estimated_lesson_count': 4,
    'icon': 'health_and_safety_rounded',
    'illustration':
        'Checklist-style safety board for personal and organizational security.',
    'color_tag': '#EAFCE7',
  },
];

const List<Map<String, Object>> cybersecurityLessonsSeed = [
  {
    'id': 'cyber-intro-l1',
    'topic_id': 'cyber-intro',
    'title': 'What Is Cybersecurity?',
    'summary': 'Define cybersecurity and why it matters in daily digital life.',
    'content':
        'Cybersecurity is the practice of protecting systems, networks, and data from unauthorized access and disruption. It is not only for experts or large companies. Anyone using online services can reduce risk by applying basic security principles consistently.',
    'minutes': 6,
    'order': 1,
  },
  {
    'id': 'cyber-intro-l2',
    'topic_id': 'cyber-intro',
    'title': 'The CIA Triad Made Simple',
    'summary':
        'Understand confidentiality, integrity, and availability as core goals.',
    'content':
        'The CIA triad is a simple model used to evaluate security decisions. Confidentiality means only authorized people can see data. Integrity means data remains accurate and unchanged. Availability means systems and data are reachable when needed.',
    'minutes': 7,
    'order': 2,
  },
  {
    'id': 'cyber-intro-l3',
    'topic_id': 'cyber-intro',
    'title': 'Common Cyber Threats and Attack Surface',
    'summary':
        'Identify malware, phishing, and weak entry points attackers target.',
    'content':
        'Threats include phishing emails, malware, credential theft, and social engineering. Your attack surface is every possible entry point an attacker can use, such as exposed services, weak passwords, or outdated apps. Reducing attack surface lowers the chance of successful attacks.',
    'minutes': 8,
    'order': 3,
  },
  {
    'id': 'cyber-intro-l4',
    'topic_id': 'cyber-intro',
    'title': 'Everyday Security Best Practices',
    'summary': 'Apply practical habits that prevent common incidents.',
    'content':
        'Use unique passwords, enable MFA, update devices quickly, and avoid unknown links or attachments. Backups and secure Wi-Fi usage also reduce damage when incidents happen. Strong security comes from many small habits done consistently.',
    'minutes': 7,
    'order': 4,
  },
  {
    'id': 'cyber-crypto-l1',
    'topic_id': 'cyber-cryptography-fundamentals',
    'title': 'Plaintext, Ciphertext, Encryption, Decryption',
    'summary':
        'Learn the basic vocabulary used in modern cryptography systems.',
    'content':
        'Plaintext is readable data, while ciphertext is scrambled data that appears unreadable without the right key. Encryption transforms plaintext into ciphertext. Decryption reverses the process so authorized users can read the original data.',
    'minutes': 6,
    'order': 1,
  },
  {
    'id': 'cyber-crypto-l2',
    'topic_id': 'cyber-cryptography-fundamentals',
    'title': 'Symmetric Key Encryption',
    'summary': 'Understand one-key encryption and its tradeoffs.',
    'content':
        'Symmetric encryption uses the same key for encryption and decryption. It is generally fast and efficient, making it suitable for bulk data encryption. The main challenge is secure key sharing between sender and receiver.',
    'minutes': 8,
    'order': 2,
  },
  {
    'id': 'cyber-crypto-l3',
    'topic_id': 'cyber-cryptography-fundamentals',
    'title': 'Public Key Encryption Basics',
    'summary':
        'Use key pairs to communicate securely without sharing private secrets.',
    'content':
        'Public key cryptography uses two keys: a public key for encryption and a private key for decryption. You can share the public key openly, but the private key must stay secret. This approach helps solve key exchange problems in untrusted networks.',
    'minutes': 9,
    'order': 3,
  },
  {
    'id': 'cyber-crypto-l4',
    'topic_id': 'cyber-cryptography-fundamentals',
    'title': 'Keys, Certificates, and Real-World Use',
    'summary':
        'Connect cryptography concepts to websites, messaging, and banking.',
    'content':
        'Certificates bind public keys to identities so users can trust who they are communicating with. Browsers use certificates to establish HTTPS connections. Cryptography also protects payment systems, messaging apps, and cloud services every day.',
    'minutes': 9,
    'order': 4,
  },
  {
    'id': 'cyber-integrity-l1',
    'topic_id': 'cyber-integrity-signatures',
    'title': 'Hash Functions and Data Fingerprints',
    'summary': 'Use hashing to detect changes in files and messages.',
    'content':
        'A hash function turns input data into a fixed-length output called a digest. Even a tiny input change produces a very different digest. This makes hashes useful for checking whether content was modified during storage or transfer.',
    'minutes': 7,
    'order': 1,
  },
  {
    'id': 'cyber-integrity-l2',
    'topic_id': 'cyber-integrity-signatures',
    'title': 'Message Authentication Codes (MACs)',
    'summary': 'Verify both integrity and shared-key authenticity.',
    'content':
        'A MAC combines a message with a shared secret key to produce a verification value. If the receiver recalculates the same MAC, the message is likely authentic and unchanged. MACs are effective when both parties share a trusted secret key.',
    'minutes': 8,
    'order': 2,
  },
  {
    'id': 'cyber-integrity-l3',
    'topic_id': 'cyber-integrity-signatures',
    'title': 'Digital Signatures Explained',
    'summary': 'Understand how private keys prove origin and integrity.',
    'content':
        'Digital signatures use private keys to sign data and public keys to verify signatures. They provide integrity, authentication, and non-repudiation in many scenarios. If verification fails, recipients know content may be tampered with or from an untrusted source.',
    'minutes': 9,
    'order': 3,
  },
  {
    'id': 'cyber-integrity-l4',
    'topic_id': 'cyber-integrity-signatures',
    'title': 'Integrity vs Confidentiality in Practice',
    'summary': 'Different goals, complementary controls, practical examples.',
    'content':
        'Confidentiality prevents unauthorized reading, while integrity prevents unauthorized modification. Some systems need both, such as software updates and online banking transactions. Choosing controls based on the business risk leads to stronger and more efficient defenses.',
    'minutes': 8,
    'order': 4,
  },
  {
    'id': 'cyber-auth-l1',
    'topic_id': 'cyber-authentication-access-control',
    'title': 'Authentication Fundamentals',
    'summary': 'Prove identity using something you know, have, or are.',
    'content':
        'Authentication answers the question: who are you? Common factors include passwords, hardware tokens, and biometrics. Combining factors improves trust and reduces the chance of account takeover.',
    'minutes': 6,
    'order': 1,
  },
  {
    'id': 'cyber-auth-l2',
    'topic_id': 'cyber-authentication-access-control',
    'title': 'Password Security and Storage Basics',
    'summary': 'Create stronger passwords and store them safely.',
    'content':
        'Strong passwords are long, unique, and hard to guess. Reusing passwords across services increases risk because one breach can expose many accounts. Systems should store password hashes, not plaintext passwords, to limit breach impact.',
    'minutes': 8,
    'order': 2,
  },
  {
    'id': 'cyber-auth-l3',
    'topic_id': 'cyber-authentication-access-control',
    'title': 'Multi-Factor Authentication (MFA)',
    'summary': 'Reduce account risk by requiring a second independent factor.',
    'content':
        'MFA adds an extra verification step after password entry, such as a one-time code or security key. This blocks many attacks that rely on stolen passwords alone. MFA is one of the highest-impact controls for both personal and enterprise accounts.',
    'minutes': 7,
    'order': 3,
  },
  {
    'id': 'cyber-auth-l4',
    'topic_id': 'cyber-authentication-access-control',
    'title': 'Authorization and Session Security',
    'summary':
        'Separate identity checks from permission checks and protect sessions.',
    'content':
        'Authorization answers the question: what can this user do? Good access control uses least privilege and role-based policies. Session security requires safe token handling, timeout policies, and protection against session hijacking.',
    'minutes': 9,
    'order': 4,
  },
  {
    'id': 'cyber-transport-l1',
    'topic_id': 'cyber-secure-communication-protocols',
    'title': 'TLS and SSL Fundamentals',
    'summary': 'Understand secure transport goals and why SSL was replaced.',
    'content':
        'Transport Layer Security, TLS, protects data while it moves across networks. SSL is an older protocol family that modern systems should no longer use. TLS provides confidentiality, integrity, and server authentication for many online services.',
    'minutes': 7,
    'order': 1,
  },
  {
    'id': 'cyber-transport-l2',
    'topic_id': 'cyber-secure-communication-protocols',
    'title': 'HTTPS and Certificate Trust',
    'summary':
        'See how web browsers build trust before sharing sensitive data.',
    'content':
        'HTTPS is HTTP layered on TLS, creating encrypted and authenticated web sessions. Certificates are validated by trusted certificate authorities and browser trust stores. Warnings about invalid certificates should never be ignored in production workflows.',
    'minutes': 8,
    'order': 2,
  },
  {
    'id': 'cyber-transport-l3',
    'topic_id': 'cyber-secure-communication-protocols',
    'title': 'TLS Handshake Overview',
    'summary':
        'Follow the high-level steps of negotiating a secure connection.',
    'content':
        'During the handshake, client and server agree on cryptographic algorithms and validate certificates. They establish shared session secrets used for fast symmetric encryption. A successful handshake creates a trusted and encrypted channel for application data.',
    'minutes': 9,
    'order': 3,
  },
  {
    'id': 'cyber-transport-l4',
    'topic_id': 'cyber-secure-communication-protocols',
    'title': 'Why Secure Transport Matters',
    'summary':
        'Connect protocol choices to real-world privacy and business risk.',
    'content':
        'Without secure transport, attackers can intercept or modify traffic in transit. Secure protocols protect credentials, financial data, and confidential business information. Choosing current protocol versions and strong cipher suites is a practical security requirement.',
    'minutes': 8,
    'order': 4,
  },
  {
    'id': 'cyber-network-l1',
    'topic_id': 'cyber-network-security-vpns',
    'title': 'Network Security Basics',
    'summary': 'Use segmentation and defense-in-depth across network layers.',
    'content':
        'Network security limits exposure by separating sensitive systems and controlling traffic flow. Segmentation reduces blast radius when incidents occur. Monitoring and policy enforcement together create stronger protection than a single control.',
    'minutes': 7,
    'order': 1,
  },
  {
    'id': 'cyber-network-l2',
    'topic_id': 'cyber-network-security-vpns',
    'title': 'IPsec Concepts',
    'summary': 'Protect IP traffic with authentication and encryption options.',
    'content':
        'IPsec secures IP packets by adding integrity checks, authentication, and optional encryption. It can operate in transport or tunnel mode depending on architecture needs. Organizations often use IPsec for site-to-site and remote access protection.',
    'minutes': 8,
    'order': 2,
  },
  {
    'id': 'cyber-network-l3',
    'topic_id': 'cyber-network-security-vpns',
    'title': 'VPN Overview and Secure Tunneling',
    'summary': 'Understand private tunnels over public networks.',
    'content':
        'A VPN creates an encrypted tunnel so traffic can travel safely across untrusted networks. VPNs help remote workers access internal resources securely. Security depends on strong authentication, secure endpoints, and correct VPN configuration.',
    'minutes': 8,
    'order': 3,
  },
  {
    'id': 'cyber-network-l4',
    'topic_id': 'cyber-network-security-vpns',
    'title': 'Packet Protection in Enterprise Networks',
    'summary':
        'Combine policies, encryption, and inspection for resilient networking.',
    'content':
        'Enterprise networks use multiple controls such as ACLs, firewalls, encryption, and anomaly detection. Packet protection is not just encryption; it also includes integrity verification and policy-based routing. Layered controls improve detection and response when suspicious traffic appears.',
    'minutes': 9,
    'order': 4,
  },
  {
    'id': 'cyber-wireless-l1',
    'topic_id': 'cyber-wireless-mobile-security',
    'title': 'Wi-Fi Security Fundamentals',
    'summary':
        'Learn why wireless networks are exposed and how to harden them.',
    'content':
        'Wireless traffic can be intercepted more easily than wired traffic because it travels through shared airspace. Strong passwords, modern encryption modes, and trusted router settings are essential. Disabling weak protocols is a basic first step for safer Wi-Fi.',
    'minutes': 7,
    'order': 1,
  },
  {
    'id': 'cyber-wireless-l2',
    'topic_id': 'cyber-wireless-mobile-security',
    'title': 'WPA, WPA2, and WPA3 Overview',
    'summary': 'Compare major Wi-Fi protection generations and best choices.',
    'content':
        'WPA3 introduces stronger protections than older WPA and WPA2 configurations. Legacy modes remain common but can be less secure when misconfigured. Using current standards and firmware updates significantly improves wireless security posture.',
    'minutes': 8,
    'order': 2,
  },
  {
    'id': 'cyber-wireless-l3',
    'topic_id': 'cyber-wireless-mobile-security',
    'title': 'Mobile Network Security Basics',
    'summary': 'Understand common risks on smartphones and tablets.',
    'content':
        'Mobile devices store sensitive personal and work data, making them high-value targets. Security controls include strong device lock methods, app permissions review, and trusted app stores. Mobile device management policies help enterprises reduce risk at scale.',
    'minutes': 8,
    'order': 3,
  },
  {
    'id': 'cyber-wireless-l4',
    'topic_id': 'cyber-wireless-mobile-security',
    'title': 'Public Wi-Fi Risks and Safe Usage',
    'summary': 'Use practical rules for safer browsing on open networks.',
    'content':
        'Public Wi-Fi can expose users to eavesdropping and rogue access points. Prefer HTTPS sites, avoid sensitive transactions on unknown networks, and use trusted VPNs when possible. Turning off auto-connect and file sharing reduces attack opportunities.',
    'minutes': 9,
    'order': 4,
  },
  {
    'id': 'cyber-email-web-l1',
    'topic_id': 'cyber-email-web-security',
    'title': 'Secure E-mail Basics',
    'summary': 'Understand secure email goals and sender trust signals.',
    'content':
        'Secure email practices include verifying senders, checking links before clicking, and avoiding risky attachments. Organizations use controls like SPF, DKIM, and DMARC to reduce spoofing. Users still play a critical role by recognizing suspicious patterns.',
    'minutes': 7,
    'order': 1,
  },
  {
    'id': 'cyber-email-web-l2',
    'topic_id': 'cyber-email-web-security',
    'title': 'Phishing, Spam, and Spoofing',
    'summary': 'Spot social and technical red flags before acting.',
    'content':
        'Phishing attempts often create urgency, fear, or rewards to trigger quick action. Spoofed addresses and lookalike domains can trick users into trusting malicious messages. Slowing down to verify context is one of the most effective defenses.',
    'minutes': 8,
    'order': 2,
  },
  {
    'id': 'cyber-email-web-l3',
    'topic_id': 'cyber-email-web-security',
    'title': 'Safe Browsing Habits',
    'summary': 'Reduce web risk through verification and cautious behavior.',
    'content':
        'Safe browsing includes checking URLs carefully, avoiding unknown downloads, and trusting browser warnings. Keep browser and extensions updated to reduce exploit risk. Good browsing hygiene lowers exposure to malware and credential theft.',
    'minutes': 8,
    'order': 3,
  },
  {
    'id': 'cyber-email-web-l4',
    'topic_id': 'cyber-email-web-security',
    'title': 'Browser and E-mail Security Awareness',
    'summary': 'Build repeatable habits for daily digital communication.',
    'content':
        'Security awareness is a process, not a one-time lesson. Report suspicious emails, verify unusual requests through a second channel, and avoid sharing sensitive data without validation. Teams that practice regularly detect attacks faster and respond more effectively.',
    'minutes': 9,
    'order': 4,
  },
  {
    'id': 'cyber-firewall-l1',
    'topic_id': 'cyber-firewalls-intrusion-detection',
    'title': 'Firewall Fundamentals',
    'summary': 'Control network traffic based on policy and trust boundaries.',
    'content':
        'A firewall enforces rules that allow or block traffic between networks or systems. It helps reduce unauthorized access and limits exposure. Effective firewall policy design starts with understanding normal business traffic patterns.',
    'minutes': 7,
    'order': 1,
  },
  {
    'id': 'cyber-firewall-l2',
    'topic_id': 'cyber-firewalls-intrusion-detection',
    'title': 'Traffic Filtering Strategies',
    'summary':
        'Apply rule sets by source, destination, protocol, and behavior.',
    'content':
        'Filtering can be based on IP addresses, ports, protocols, applications, and context. Too-permissive rules increase risk, while overly strict rules can break services. Security teams tune policies continuously as environments change.',
    'minutes': 8,
    'order': 2,
  },
  {
    'id': 'cyber-firewall-l3',
    'topic_id': 'cyber-firewalls-intrusion-detection',
    'title': 'IDS and IPS Concepts',
    'summary': 'Detect suspicious behavior and block known malicious patterns.',
    'content':
        'IDS systems alert on suspicious activity, while IPS systems can actively block detected threats. Signature-based detection catches known attacks, and anomaly detection helps identify unusual behavior. Combining both improves visibility and protection depth.',
    'minutes': 9,
    'order': 3,
  },
  {
    'id': 'cyber-firewall-l4',
    'topic_id': 'cyber-firewalls-intrusion-detection',
    'title': 'Monitoring and Layered Defense',
    'summary':
        'Use logs, alerts, and response playbooks to strengthen resilience.',
    'content':
        'Monitoring turns raw network events into actionable security insights. Layered defense combines prevention, detection, and response controls so failures in one layer are caught by another. This strategy is central to practical defensive security programs.',
    'minutes': 9,
    'order': 4,
  },
  {
    'id': 'cyber-awareness-l1',
    'topic_id': 'cyber-awareness-safe-practices',
    'title': 'Social Engineering Awareness',
    'summary':
        'Recognize manipulation tactics used to bypass technical controls.',
    'content':
        'Social engineering targets human trust through urgency, authority, and emotional pressure. Attackers may use calls, texts, emails, or in-person tricks. Awareness and verification habits reduce the chance of accidental disclosure or unsafe action.',
    'minutes': 7,
    'order': 1,
  },
  {
    'id': 'cyber-awareness-l2',
    'topic_id': 'cyber-awareness-safe-practices',
    'title': 'Password Managers and Secure Updates',
    'summary': 'Adopt tools and update habits that reduce daily risk.',
    'content':
        'Password managers help create and store unique strong passwords safely. Regular software updates patch known vulnerabilities before attackers exploit them. Delaying updates often increases exposure without any security benefit.',
    'minutes': 8,
    'order': 2,
  },
  {
    'id': 'cyber-awareness-l3',
    'topic_id': 'cyber-awareness-safe-practices',
    'title': 'Data Privacy and Protection Mindset',
    'summary':
        'Treat personal and organizational data with context-aware care.',
    'content':
        'Privacy means collecting and sharing only what is necessary for a clear purpose. Sensitive data should be classified and handled with stronger controls. Privacy-aware teams reduce legal risk and strengthen customer trust.',
    'minutes': 8,
    'order': 3,
  },
  {
    'id': 'cyber-awareness-l4',
    'topic_id': 'cyber-awareness-safe-practices',
    'title': 'Security Hygiene for People and Teams',
    'summary':
        'Build long-term safe practices across personal and organizational workflows.',
    'content':
        'Security hygiene includes regular review of permissions, backups, phishing drills, and incident reporting culture. Small routine checks prevent larger failures over time. Security maturity grows when safe behavior is practiced and measured consistently.',
    'minutes': 9,
    'order': 4,
  },
];

const List<Map<String, Object>> cybersecurityQuizzesSeed = [
  {
    'id': 'quiz-cyber-intro',
    'topic_id': 'cyber-intro',
    'title': 'Introduction to Cybersecurity Quiz',
    'question_count': 5,
    'difficulty': 'Beginner',
  },
  {
    'id': 'quiz-cyber-cryptography-fundamentals',
    'topic_id': 'cyber-cryptography-fundamentals',
    'title': 'Cryptography Fundamentals Quiz',
    'question_count': 5,
    'difficulty': 'Beginner',
  },
  {
    'id': 'quiz-cyber-integrity-signatures',
    'topic_id': 'cyber-integrity-signatures',
    'title': 'Message Integrity and Digital Signatures Quiz',
    'question_count': 5,
    'difficulty': 'Intermediate',
  },
  {
    'id': 'quiz-cyber-authentication-access-control',
    'topic_id': 'cyber-authentication-access-control',
    'title': 'Authentication and Access Control Quiz',
    'question_count': 5,
    'difficulty': 'Beginner',
  },
  {
    'id': 'quiz-cyber-secure-communication-protocols',
    'topic_id': 'cyber-secure-communication-protocols',
    'title': 'Secure Communication Protocols Quiz',
    'question_count': 5,
    'difficulty': 'Intermediate',
  },
  {
    'id': 'quiz-cyber-network-security-vpns',
    'topic_id': 'cyber-network-security-vpns',
    'title': 'Network Security and VPNs Quiz',
    'question_count': 5,
    'difficulty': 'Intermediate',
  },
  {
    'id': 'quiz-cyber-wireless-mobile-security',
    'topic_id': 'cyber-wireless-mobile-security',
    'title': 'Wireless and Mobile Security Quiz',
    'question_count': 5,
    'difficulty': 'Intermediate',
  },
  {
    'id': 'quiz-cyber-email-web-security',
    'topic_id': 'cyber-email-web-security',
    'title': 'E-mail and Web Security Quiz',
    'question_count': 5,
    'difficulty': 'Intermediate',
  },
  {
    'id': 'quiz-cyber-firewalls-intrusion-detection',
    'topic_id': 'cyber-firewalls-intrusion-detection',
    'title': 'Firewalls and Intrusion Detection Quiz',
    'question_count': 5,
    'difficulty': 'Intermediate',
  },
  {
    'id': 'quiz-cyber-awareness-safe-practices',
    'topic_id': 'cyber-awareness-safe-practices',
    'title': 'Cybersecurity Awareness and Safe Practices Quiz',
    'question_count': 5,
    'difficulty': 'Beginner',
  },
];

const List<Map<String, Object>> cybersecurityQuizQuestionsSeed = [
  {
    'id': 'cyber-intro-q1',
    'quiz_id': 'quiz-cyber-intro',
    'topic_id': 'cyber-intro',
    'prompt':
        'A team stores customer files with strict access controls, but accidental edits are common. Which CIA goal is weakest?',
    'options': [
      'Confidentiality',
      'Integrity',
      'Availability',
      'Non-repudiation',
    ],
    'correct_index': 1,
    'explanation':
        'Unauthorized or accidental modification relates to integrity, not confidentiality.',
    'order': 1,
  },
  {
    'id': 'cyber-intro-q2',
    'quiz_id': 'quiz-cyber-intro',
    'topic_id': 'cyber-intro',
    'prompt':
        'Which action most directly reduces attack surface in a small web app?',
    'options': [
      'Add more user roles',
      'Disable unused services and ports',
      'Increase password length only',
      'Use a brighter UI theme',
    ],
    'correct_index': 1,
    'explanation':
        'Removing unnecessary exposed components lowers possible entry points.',
    'order': 2,
  },
  {
    'id': 'cyber-intro-q3',
    'quiz_id': 'quiz-cyber-intro',
    'topic_id': 'cyber-intro',
    'prompt':
        'A user receives an urgent message asking for credentials. What is the best first response?',
    'options': [
      'Reply quickly to avoid account lockout',
      'Verify through a trusted second channel',
      'Forward to friends for advice',
      'Ignore all future messages permanently',
    ],
    'correct_index': 1,
    'explanation':
        'Verification through a known trusted channel is a strong anti-phishing step.',
    'order': 3,
  },
  {
    'id': 'cyber-intro-q4',
    'quiz_id': 'quiz-cyber-intro',
    'topic_id': 'cyber-intro',
    'prompt': 'Which set best represents basic cybersecurity hygiene?',
    'options': [
      'Reuse one strong password, skip updates',
      'Unique passwords, MFA, updates, cautious clicking',
      'Public Wi-Fi only, no backups',
      'Install many random browser extensions',
    ],
    'correct_index': 1,
    'explanation':
        'Layered safe habits reduce both likelihood and impact of incidents.',
    'order': 4,
  },
  {
    'id': 'cyber-intro-q5',
    'quiz_id': 'quiz-cyber-intro',
    'topic_id': 'cyber-intro',
    'prompt':
        'A site is online but leaking private records. Which CIA goal is currently failing most?',
    'options': ['Availability', 'Confidentiality', 'Integrity', 'Usability'],
    'correct_index': 1,
    'explanation': 'Exposure of private records is a confidentiality failure.',
    'order': 5,
  },
  {
    'id': 'cyber-crypto-q1',
    'quiz_id': 'quiz-cyber-cryptography-fundamentals',
    'topic_id': 'cyber-cryptography-fundamentals',
    'prompt':
        'Why is ciphertext useful even if attackers intercept network traffic?',
    'options': [
      'It guarantees no one can copy data',
      'It hides readable meaning without the proper key',
      'It replaces authentication',
      'It removes need for backups',
    ],
    'correct_index': 1,
    'explanation':
        'Ciphertext protects confidentiality by making intercepted data unreadable.',
    'order': 1,
  },
  {
    'id': 'cyber-crypto-q2',
    'quiz_id': 'quiz-cyber-cryptography-fundamentals',
    'topic_id': 'cyber-cryptography-fundamentals',
    'prompt': 'What is the main operational challenge of symmetric encryption?',
    'options': [
      'It is always slower than public key methods',
      'Securely sharing the secret key',
      'It cannot protect files at rest',
      'It never works with mobile apps',
    ],
    'correct_index': 1,
    'explanation':
        'Symmetric encryption is fast, but key distribution is difficult at scale.',
    'order': 2,
  },
  {
    'id': 'cyber-crypto-q3',
    'quiz_id': 'quiz-cyber-cryptography-fundamentals',
    'topic_id': 'cyber-cryptography-fundamentals',
    'prompt': 'In public key systems, which key should remain secret?',
    'options': ['Public key', 'Session key', 'Private key', 'Certificate'],
    'correct_index': 2,
    'explanation':
        'The private key must stay confidential for the key pair model to work.',
    'order': 3,
  },
  {
    'id': 'cyber-crypto-q4',
    'quiz_id': 'quiz-cyber-cryptography-fundamentals',
    'topic_id': 'cyber-cryptography-fundamentals',
    'prompt': 'What role does a certificate play in secure web communication?',
    'options': [
      'Compresses network packets',
      'Binds a public key to an identity',
      'Stores browser history safely',
      'Replaces all firewall rules',
    ],
    'correct_index': 1,
    'explanation':
        'Certificates let clients verify who owns the presented public key.',
    'order': 4,
  },
  {
    'id': 'cyber-crypto-q5',
    'quiz_id': 'quiz-cyber-cryptography-fundamentals',
    'topic_id': 'cyber-cryptography-fundamentals',
    'prompt':
        'Which scenario is a strong use case for combining public and symmetric encryption?',
    'options': [
      'Fast key exchange with efficient bulk data encryption',
      'Replacing user authentication entirely',
      'Preventing all phishing attacks',
      'Eliminating software updates',
    ],
    'correct_index': 0,
    'explanation':
        'Many protocols use public key crypto for key exchange, then symmetric for speed.',
    'order': 5,
  },
  {
    'id': 'cyber-integrity-q1',
    'quiz_id': 'quiz-cyber-integrity-signatures',
    'topic_id': 'cyber-integrity-signatures',
    'prompt':
        'A downloaded installer has a different hash than expected. What should you infer first?',
    'options': [
      'The file is definitely safe',
      'The file may be changed or corrupted',
      'The hash algorithm is outdated only',
      'The network speed was too slow',
    ],
    'correct_index': 1,
    'explanation':
        'Hash mismatch is a direct integrity warning and should trigger caution.',
    'order': 1,
  },
  {
    'id': 'cyber-integrity-q2',
    'quiz_id': 'quiz-cyber-integrity-signatures',
    'topic_id': 'cyber-integrity-signatures',
    'prompt':
        'When two systems share a secret key, which control best confirms message integrity and origin?',
    'options': [
      'MAC',
      'Plain hash only',
      'Public certificate alone',
      'Compression checksum',
    ],
    'correct_index': 0,
    'explanation':
        'A MAC uses the shared secret, so only key holders can generate valid values.',
    'order': 2,
  },
  {
    'id': 'cyber-integrity-q3',
    'quiz_id': 'quiz-cyber-integrity-signatures',
    'topic_id': 'cyber-integrity-signatures',
    'prompt':
        'What is a major benefit of digital signatures over plain hashing?',
    'options': [
      'They encrypt data faster',
      'They add sender authenticity with integrity',
      'They remove need for private keys',
      'They improve Wi-Fi signal strength',
    ],
    'correct_index': 1,
    'explanation':
        'Signatures provide authenticity and integrity verification, not just change detection.',
    'order': 3,
  },
  {
    'id': 'cyber-integrity-q4',
    'quiz_id': 'quiz-cyber-integrity-signatures',
    'topic_id': 'cyber-integrity-signatures',
    'prompt': 'Which statement best compares confidentiality and integrity?',
    'options': [
      'Both mean data must stay online',
      'Confidentiality hides data; integrity protects correctness',
      'Integrity is only for passwords',
      'Confidentiality prevents all malware',
    ],
    'correct_index': 1,
    'explanation':
        'These are separate goals that often work together in secure systems.',
    'order': 4,
  },
  {
    'id': 'cyber-integrity-q5',
    'quiz_id': 'quiz-cyber-integrity-signatures',
    'topic_id': 'cyber-integrity-signatures',
    'prompt':
        'For software update validation, which combination is most appropriate?',
    'options': [
      'Hash and digital signature verification',
      'Password reset and CAPTCHA',
      'Network compression and caching',
      'Only antivirus scanning',
    ],
    'correct_index': 0,
    'explanation':
        'Update trust relies on integrity checks and publisher authenticity proof.',
    'order': 5,
  },
  {
    'id': 'cyber-auth-q1',
    'quiz_id': 'quiz-cyber-authentication-access-control',
    'topic_id': 'cyber-authentication-access-control',
    'prompt':
        'Authentication primarily answers which question in a secure system?',
    'options': [
      'What data is encrypted?',
      'Who is requesting access?',
      'How fast is the network?',
      'When was the app updated?',
    ],
    'correct_index': 1,
    'explanation':
        'Authentication verifies identity before access decisions are made.',
    'order': 1,
  },
  {
    'id': 'cyber-auth-q2',
    'quiz_id': 'quiz-cyber-authentication-access-control',
    'topic_id': 'cyber-authentication-access-control',
    'prompt': 'Which password practice most reduces account compromise risk?',
    'options': [
      'Use one complex password for all sites',
      'Use unique long passwords managed securely',
      'Change password every day manually',
      'Share passwords with trusted colleagues',
    ],
    'correct_index': 1,
    'explanation':
        'Uniqueness prevents breach reuse across different services.',
    'order': 2,
  },
  {
    'id': 'cyber-auth-q3',
    'quiz_id': 'quiz-cyber-authentication-access-control',
    'topic_id': 'cyber-authentication-access-control',
    'prompt': 'Why does MFA significantly improve security in real incidents?',
    'options': [
      'It hides network traffic automatically',
      'It blocks many attacks using stolen passwords',
      'It removes need for authorization rules',
      'It guarantees perfect user behavior',
    ],
    'correct_index': 1,
    'explanation':
        'A second independent factor raises attacker effort and failure rates.',
    'order': 3,
  },
  {
    'id': 'cyber-auth-q4',
    'quiz_id': 'quiz-cyber-authentication-access-control',
    'topic_id': 'cyber-authentication-access-control',
    'prompt': 'Which example best describes authorization, not authentication?',
    'options': [
      'Verifying a biometric scan',
      'Granting admins access to billing exports',
      'Checking password complexity',
      'Issuing login one-time codes',
    ],
    'correct_index': 1,
    'explanation': 'Authorization defines permissions after identity is known.',
    'order': 4,
  },
  {
    'id': 'cyber-auth-q5',
    'quiz_id': 'quiz-cyber-authentication-access-control',
    'topic_id': 'cyber-authentication-access-control',
    'prompt':
        'Which session security control is most effective against token theft misuse?',
    'options': [
      'Long-lived unlimited sessions',
      'Secure cookie flags and session expiration',
      'Publicly logged session IDs',
      'Disabling logout options',
    ],
    'correct_index': 1,
    'explanation':
        'Secure token handling and expiration reduce replay and hijack risk.',
    'order': 5,
  },
  {
    'id': 'cyber-transport-q1',
    'quiz_id': 'quiz-cyber-secure-communication-protocols',
    'topic_id': 'cyber-secure-communication-protocols',
    'prompt': 'Why is TLS preferred over legacy SSL in modern deployments?',
    'options': [
      'TLS has no handshake overhead',
      'TLS has stronger modern security design and support',
      'SSL encrypts faster in all cases',
      'TLS does not use certificates',
    ],
    'correct_index': 1,
    'explanation':
        'SSL is deprecated; TLS provides stronger and actively maintained security.',
    'order': 1,
  },
  {
    'id': 'cyber-transport-q2',
    'quiz_id': 'quiz-cyber-secure-communication-protocols',
    'topic_id': 'cyber-secure-communication-protocols',
    'prompt':
        'What does HTTPS add to plain HTTP from a user security perspective?',
    'options': [
      'Faster page rendering only',
      'Encryption and server identity verification',
      'Automatic malware blocking',
      'Unlimited session lifetime',
    ],
    'correct_index': 1,
    'explanation':
        'HTTPS protects traffic confidentiality and authenticity in transit.',
    'order': 2,
  },
  {
    'id': 'cyber-transport-q3',
    'quiz_id': 'quiz-cyber-secure-communication-protocols',
    'topic_id': 'cyber-secure-communication-protocols',
    'prompt':
        'During a TLS handshake, what is a key outcome before app data flows?',
    'options': [
      'Database schema migration',
      'Negotiated cryptographic parameters and shared secrets',
      'Operating system update',
      'Permanent user account creation',
    ],
    'correct_index': 1,
    'explanation':
        'Handshake agreement and key establishment are required first.',
    'order': 3,
  },
  {
    'id': 'cyber-transport-q4',
    'quiz_id': 'quiz-cyber-secure-communication-protocols',
    'topic_id': 'cyber-secure-communication-protocols',
    'prompt':
        'What is the best response to repeated certificate warnings on a critical internal app?',
    'options': [
      'Ignore warnings to save time',
      'Investigate trust chain and certificate validity immediately',
      'Disable browser checks permanently',
      'Switch to unencrypted HTTP',
    ],
    'correct_index': 1,
    'explanation':
        'Certificate warnings can indicate misconfiguration or active interception risk.',
    'order': 4,
  },
  {
    'id': 'cyber-transport-q5',
    'quiz_id': 'quiz-cyber-secure-communication-protocols',
    'topic_id': 'cyber-secure-communication-protocols',
    'prompt':
        'Which design choice best protects credentials sent over public networks?',
    'options': [
      'Plain TCP with custom obfuscation',
      'TLS-secured transport with modern ciphers',
      'HTTP only with long passwords',
      'Emailing credentials as backup',
    ],
    'correct_index': 1,
    'explanation':
        'Modern TLS is the standard for protecting credentials in transit.',
    'order': 5,
  },
  {
    'id': 'cyber-network-q1',
    'quiz_id': 'quiz-cyber-network-security-vpns',
    'topic_id': 'cyber-network-security-vpns',
    'prompt':
        'How does network segmentation improve security during incidents?',
    'options': [
      'It increases internet speed',
      'It limits lateral movement and blast radius',
      'It replaces endpoint protection',
      'It prevents all phishing',
    ],
    'correct_index': 1,
    'explanation':
        'Segmentation contains attacker movement across environments.',
    'order': 1,
  },
  {
    'id': 'cyber-network-q2',
    'quiz_id': 'quiz-cyber-network-security-vpns',
    'topic_id': 'cyber-network-security-vpns',
    'prompt': 'Which statement best describes IPsec in enterprise use?',
    'options': [
      'It secures only email attachments',
      'It protects IP traffic with integrity and optional encryption',
      'It is only for Wi-Fi passwords',
      'It disables routing protocols',
    ],
    'correct_index': 1,
    'explanation':
        'IPsec is a network-layer protection suite for packet security.',
    'order': 2,
  },
  {
    'id': 'cyber-network-q3',
    'quiz_id': 'quiz-cyber-network-security-vpns',
    'topic_id': 'cyber-network-security-vpns',
    'prompt': 'What is the main purpose of VPN tunneling over public internet?',
    'options': [
      'Increase social media reach',
      'Create encrypted private communication paths',
      'Bypass all corporate policies',
      'Remove need for authentication',
    ],
    'correct_index': 1,
    'explanation':
        'VPN tunnels protect traffic confidentiality and integrity in transit.',
    'order': 3,
  },
  {
    'id': 'cyber-network-q4',
    'quiz_id': 'quiz-cyber-network-security-vpns',
    'topic_id': 'cyber-network-security-vpns',
    'prompt':
        'A remote user has VPN access but compromised endpoint security. What is the biggest remaining risk?',
    'options': [
      'No risk remains because traffic is encrypted',
      'Compromised endpoint can abuse trusted tunnel access',
      'VPN always blocks malware execution',
      'Encryption prevents unauthorized local actions',
    ],
    'correct_index': 1,
    'explanation':
        'VPN secures transit, but endpoint compromise still enables abuse.',
    'order': 4,
  },
  {
    'id': 'cyber-network-q5',
    'quiz_id': 'quiz-cyber-network-security-vpns',
    'topic_id': 'cyber-network-security-vpns',
    'prompt':
        'Which strategy reflects layered packet protection in enterprises?',
    'options': [
      'Single perimeter firewall only',
      'Encryption, filtering, monitoring, and response workflows',
      'Disable all outbound traffic permanently',
      'Use default vendor settings forever',
    ],
    'correct_index': 1,
    'explanation':
        'Layered controls provide depth against varied network threats.',
    'order': 5,
  },
  {
    'id': 'cyber-wireless-q1',
    'quiz_id': 'quiz-cyber-wireless-mobile-security',
    'topic_id': 'cyber-wireless-mobile-security',
    'prompt':
        'Why is wireless security often considered more exposed than wired security?',
    'options': [
      'Wireless packets always bypass encryption',
      'Radio signals can be intercepted in shared physical space',
      'Wired networks cannot be attacked',
      'Wireless devices do not support updates',
    ],
    'correct_index': 1,
    'explanation':
        'Shared airspace increases interception opportunities without proper controls.',
    'order': 1,
  },
  {
    'id': 'cyber-wireless-q2',
    'quiz_id': 'quiz-cyber-wireless-mobile-security',
    'topic_id': 'cyber-wireless-mobile-security',
    'prompt':
        'What is the best default recommendation for new Wi-Fi deployments today?',
    'options': [
      'Use open network mode for convenience',
      'Prefer WPA3 with strong credentials and updates',
      'Use WEP for compatibility',
      'Hide SSID as primary defense',
    ],
    'correct_index': 1,
    'explanation':
        'WPA3 plus strong passwords and maintenance improves wireless protection.',
    'order': 2,
  },
  {
    'id': 'cyber-wireless-q3',
    'quiz_id': 'quiz-cyber-wireless-mobile-security',
    'topic_id': 'cyber-wireless-mobile-security',
    'prompt': 'Which mobile device habit best reduces data exposure risk?',
    'options': [
      'Install apps from any source quickly',
      'Review app permissions and keep OS updated',
      'Disable lock screen for faster access',
      'Share devices without user separation',
    ],
    'correct_index': 1,
    'explanation':
        'Permission control and updates reduce exploit and misuse opportunities.',
    'order': 3,
  },
  {
    'id': 'cyber-wireless-q4',
    'quiz_id': 'quiz-cyber-wireless-mobile-security',
    'topic_id': 'cyber-wireless-mobile-security',
    'prompt':
        'On public Wi-Fi, which behavior is the safest for sensitive accounts?',
    'options': [
      'Use any open portal for banking immediately',
      'Use trusted VPN and avoid high-risk transactions',
      'Turn off device encryption',
      'Share hotspot password publicly',
    ],
    'correct_index': 1,
    'explanation':
        'Combining cautious behavior and secure tunnels lowers exposure.',
    'order': 4,
  },
  {
    'id': 'cyber-wireless-q5',
    'quiz_id': 'quiz-cyber-wireless-mobile-security',
    'topic_id': 'cyber-wireless-mobile-security',
    'prompt': 'Why is auto-connect to known open networks risky?',
    'options': [
      'It saves battery life too much',
      'Devices may join rogue lookalike access points',
      'It disables TLS automatically',
      'It blocks emergency calls',
    ],
    'correct_index': 1,
    'explanation':
        'Attackers can mimic trusted network names to capture traffic.',
    'order': 5,
  },
  {
    'id': 'cyber-email-web-q1',
    'quiz_id': 'quiz-cyber-email-web-security',
    'topic_id': 'cyber-email-web-security',
    'prompt':
        'An email asks for immediate invoice payment to a new bank account. What is the best control before acting?',
    'options': [
      'Pay quickly to avoid late fees',
      'Verify request via known independent channel',
      'Reply asking if message is safe',
      'Forward externally for approval',
    ],
    'correct_index': 1,
    'explanation':
        'Out-of-band verification helps stop spoofed business email fraud.',
    'order': 1,
  },
  {
    'id': 'cyber-email-web-q2',
    'quiz_id': 'quiz-cyber-email-web-security',
    'topic_id': 'cyber-email-web-security',
    'prompt':
        'What is a common sign of phishing rather than legitimate communication?',
    'options': [
      'Context-aware language and known workflow',
      'Urgency plus unusual link domain mismatch',
      'Expected sender and transaction details',
      'Standard signed company policy message',
    ],
    'correct_index': 1,
    'explanation':
        'Urgency and suspicious domains are strong phishing indicators.',
    'order': 2,
  },
  {
    'id': 'cyber-email-web-q3',
    'quiz_id': 'quiz-cyber-email-web-security',
    'topic_id': 'cyber-email-web-security',
    'prompt': 'Why are browser updates essential for web security?',
    'options': [
      'They only change visual themes',
      'They patch known vulnerabilities and improve protections',
      'They disable certificate checks',
      'They eliminate need for user caution',
    ],
    'correct_index': 1,
    'explanation':
        'Patch management closes exploit paths used by active threats.',
    'order': 3,
  },
  {
    'id': 'cyber-email-web-q4',
    'quiz_id': 'quiz-cyber-email-web-security',
    'topic_id': 'cyber-email-web-security',
    'prompt': 'Which action best supports secure browsing behavior?',
    'options': [
      'Download unknown extensions for convenience',
      'Review URL carefully before entering credentials',
      'Ignore browser warning dialogs',
      'Share autofill data across public devices',
    ],
    'correct_index': 1,
    'explanation':
        'URL verification helps prevent credential theft on lookalike sites.',
    'order': 4,
  },
  {
    'id': 'cyber-email-web-q5',
    'quiz_id': 'quiz-cyber-email-web-security',
    'topic_id': 'cyber-email-web-security',
    'prompt':
        'What is the strongest team behavior for reducing email-based incidents?',
    'options': [
      'Delete all external mail permanently',
      'Report suspicious messages and follow validation playbooks',
      'Open attachments to test antivirus',
      'Use shared inbox passwords',
    ],
    'correct_index': 1,
    'explanation':
        'Reporting and repeatable procedures improve response and learning.',
    'order': 5,
  },
  {
    'id': 'cyber-firewall-q1',
    'quiz_id': 'quiz-cyber-firewalls-intrusion-detection',
    'topic_id': 'cyber-firewalls-intrusion-detection',
    'prompt': 'What is the primary purpose of a firewall in network defense?',
    'options': [
      'Encrypt every file on disk',
      'Apply policy-based traffic allow and block decisions',
      'Create user passwords automatically',
      'Replace endpoint monitoring tools',
    ],
    'correct_index': 1,
    'explanation': 'Firewalls enforce traffic policy at network boundaries.',
    'order': 1,
  },
  {
    'id': 'cyber-firewall-q2',
    'quiz_id': 'quiz-cyber-firewalls-intrusion-detection',
    'topic_id': 'cyber-firewalls-intrusion-detection',
    'prompt': 'Why can over-permissive filtering rules be dangerous?',
    'options': [
      'They increase system uptime',
      'They expose unnecessary services to potential attackers',
      'They simplify auditing only',
      'They improve least privilege automatically',
    ],
    'correct_index': 1,
    'explanation':
        'Excessive allow rules expand attack opportunities significantly.',
    'order': 2,
  },
  {
    'id': 'cyber-firewall-q3',
    'quiz_id': 'quiz-cyber-firewalls-intrusion-detection',
    'topic_id': 'cyber-firewalls-intrusion-detection',
    'prompt': 'How does IDS differ from IPS in operational behavior?',
    'options': [
      'IDS blocks traffic; IPS only logs',
      'IDS alerts; IPS can alert and actively block',
      'Both only run on endpoints',
      'Neither uses signatures or anomalies',
    ],
    'correct_index': 1,
    'explanation':
        'IDS is detection-oriented, IPS adds inline prevention capability.',
    'order': 3,
  },
  {
    'id': 'cyber-firewall-q4',
    'quiz_id': 'quiz-cyber-firewalls-intrusion-detection',
    'topic_id': 'cyber-firewalls-intrusion-detection',
    'prompt':
        'What is the biggest value of monitoring firewall and IDS logs together?',
    'options': [
      'It removes need for incident response',
      'It provides context for faster and better threat decisions',
      'It guarantees zero false positives',
      'It replaces access control policies',
    ],
    'correct_index': 1,
    'explanation':
        'Correlated visibility improves detection quality and response speed.',
    'order': 4,
  },
  {
    'id': 'cyber-firewall-q5',
    'quiz_id': 'quiz-cyber-firewalls-intrusion-detection',
    'topic_id': 'cyber-firewalls-intrusion-detection',
    'prompt':
        'Which architecture best matches a layered defensive security model?',
    'options': [
      'Single perimeter control with no monitoring',
      'Firewall + IDS/IPS + endpoint controls + response process',
      'Open inbound access with strict password policy only',
      'Disable logging to reduce storage costs',
    ],
    'correct_index': 1,
    'explanation':
        'Layered architecture ensures gaps in one control are backed by others.',
    'order': 5,
  },
  {
    'id': 'cyber-awareness-q1',
    'quiz_id': 'quiz-cyber-awareness-safe-practices',
    'topic_id': 'cyber-awareness-safe-practices',
    'prompt':
        'A caller claims to be IT and asks for your one-time MFA code. What should you do?',
    'options': [
      'Share it to resolve issue quickly',
      'Refuse and report through official support channel',
      'Send it by email instead',
      'Post in team chat for confirmation',
    ],
    'correct_index': 1,
    'explanation':
        'MFA codes are secrets; legitimate support should never request them.',
    'order': 1,
  },
  {
    'id': 'cyber-awareness-q2',
    'quiz_id': 'quiz-cyber-awareness-safe-practices',
    'topic_id': 'cyber-awareness-safe-practices',
    'prompt':
        'Why are password managers recommended in modern security programs?',
    'options': [
      'They let users memorize fewer weak passwords',
      'They enable unique strong passwords across many services',
      'They replace MFA completely',
      'They stop all phishing attacks',
    ],
    'correct_index': 1,
    'explanation':
        'Managers reduce reuse by generating and storing unique credentials.',
    'order': 2,
  },
  {
    'id': 'cyber-awareness-q3',
    'quiz_id': 'quiz-cyber-awareness-safe-practices',
    'topic_id': 'cyber-awareness-safe-practices',
    'prompt':
        'What is the strongest reason to apply software updates promptly?',
    'options': [
      'To change app icons frequently',
      'To patch known vulnerabilities before exploitation',
      'To reduce need for backups',
      'To disable security logs',
    ],
    'correct_index': 1,
    'explanation': 'Prompt patching closes known security holes quickly.',
    'order': 3,
  },
  {
    'id': 'cyber-awareness-q4',
    'quiz_id': 'quiz-cyber-awareness-safe-practices',
    'topic_id': 'cyber-awareness-safe-practices',
    'prompt': 'Which behavior best reflects a privacy-aware mindset at work?',
    'options': [
      'Collect all possible user data by default',
      'Collect only necessary data for clear approved purposes',
      'Share sensitive exports in public channels',
      'Store personal data without classification',
    ],
    'correct_index': 1,
    'explanation':
        'Data minimization and purpose limitation are core privacy principles.',
    'order': 4,
  },
  {
    'id': 'cyber-awareness-q5',
    'quiz_id': 'quiz-cyber-awareness-safe-practices',
    'topic_id': 'cyber-awareness-safe-practices',
    'prompt':
        'Which routine most improves long-term security hygiene for teams?',
    'options': [
      'Ignore small suspicious events',
      'Run periodic reviews, drills, and clear reporting practices',
      'Reset all systems after every email',
      'Avoid documenting response steps',
    ],
    'correct_index': 1,
    'explanation':
        'Regular practice and review build a resilient security culture.',
    'order': 5,
  },
];

const List<Map<String, Object>> cybersecurityAchievementsMappingSeed = [
  {
    'id': 'first_lesson',
    'title': 'First Secure Step',
    'description': 'Complete your first cybersecurity lesson.',
    'unlock_hint': 'Finish any lesson',
    'trigger': 'first_lesson',
  },
  {
    'id': 'topic_complete',
    'title': 'Topic Secured',
    'description': 'Complete all lessons in one cybersecurity topic.',
    'unlock_hint': 'Finish every lesson in one topic',
    'trigger': 'topic_complete',
  },
  {
    'id': 'first_quiz',
    'title': 'Threat Checker',
    'description': 'Submit your first cybersecurity quiz.',
    'unlock_hint': 'Take any topic quiz',
    'trigger': 'first_quiz',
  },
  {
    'id': 'perfect_score',
    'title': 'Signal Clear',
    'description': 'Score 100% in a cybersecurity quiz.',
    'unlock_hint': 'Answer every question correctly',
    'trigger': 'perfect_score',
  },
  {
    'id': 'consistent_learner',
    'title': 'Blue Team Momentum',
    'description': 'Complete three full cybersecurity topics.',
    'unlock_hint': 'Finish 3 topics end-to-end',
    'trigger': 'consistent_learner',
  },
  {
    'id': 'badge_collector',
    'title': 'Security Badge Collector',
    'description': 'Unlock four cybersecurity achievements.',
    'unlock_hint': 'Collect 4 badges in the app',
    'trigger': 'badge_collector',
  },
];
