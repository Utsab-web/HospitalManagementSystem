<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Patient Registration</title>

    <link rel="stylesheet" href="../css/output.css">
</head>

<body class="bg-emerald-50 p-10">

<div class="max-w-[1100px] mx-auto">

    <h1 class="text-emerald-800 text-3xl font-bold mb-6">New Patient Registration</h1>

    <div class="bg-white rounded-2xl shadow-lg p-8">

        <c:if test="${not empty errorMessage}">
            <div class="mb-6 p-3 border border-red-300 bg-red-100 text-red-700 rounded-lg text-sm">
                    ${errorMessage}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/registerPatient" method="post">

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                <div>

                    <h3 class="text-emerald-800 text-lg font-semibold mb-4">Personal Information</h3>

                    <div class="mb-4">
                        <label class="block mb-1.5 font-bold">First Name</label>
                        <input type="text" name="firstName" required
                               value="${fn:escapeXml(param.firstName)}"
                               class="w-full p-3 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>

                    <div class="mb-4">
                        <label class="block mb-1.5 font-bold">Last Name</label>
                        <input type="text" name="lastName" required
                               value="${fn:escapeXml(param.lastName)}"
                               class="w-full p-3 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>

                    <div class="mb-4">
                        <label class="block mb-1.5 font-bold">Date of Birth</label>
                        <input type="date" name="dateOfBirth" required
                               value="${param.dateOfBirth}"
                               class="w-full p-3 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>

                    <div class="mb-4">
                        <label class="block mb-1.5 font-bold">Gender</label>
                        <select name="gender" required
                                class="w-full p-3 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500">
                            <option value="" disabled ${empty param.gender ? 'selected' : ''}>Select Gender</option>
                            <option value="Male" ${param.gender == 'Male' ? 'selected' : ''}>Male</option>
                            <option value="Female" ${param.gender == 'Female' ? 'selected' : ''}>Female</option>
                            <option value="Other" ${param.gender == 'Other' ? 'selected' : ''}>Other</option>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label class="block mb-1.5 font-bold">Blood Group</label>
                        <select name="bloodGroup"
                                class="w-full p-3 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500">
                            <option value="" disabled ${empty param.bloodGroup ? 'selected' : ''}>Select Blood Group</option>
                            <option value="A+"  ${param.bloodGroup == 'A+'  ? 'selected' : ''}>A+</option>
                            <option value="A-"  ${param.bloodGroup == 'A-'  ? 'selected' : ''}>A-</option>
                            <option value="B+"  ${param.bloodGroup == 'B+'  ? 'selected' : ''}>B+</option>
                            <option value="B-"  ${param.bloodGroup == 'B-'  ? 'selected' : ''}>B-</option>
                            <option value="AB+" ${param.bloodGroup == 'AB+' ? 'selected' : ''}>AB+</option>
                            <option value="AB-" ${param.bloodGroup == 'AB-' ? 'selected' : ''}>AB-</option>
                            <option value="O+"  ${param.bloodGroup == 'O+'  ? 'selected' : ''}>O+</option>
                            <option value="O-"  ${param.bloodGroup == 'O-'  ? 'selected' : ''}>O-</option>
                        </select>
                    </div>

                </div>

                <div>

                    <h3 class="text-emerald-800 text-lg font-semibold mb-4">Contact &amp; Account</h3>

                    <div class="mb-4">
                        <label class="block mb-1.5 font-bold">Phone Number</label>
                        <input type="text" name="phoneNumber" required
                               value="${fn:escapeXml(param.phoneNumber)}"
                               class="w-full p-3 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>

                    <div class="mb-4">
                        <label class="block mb-1.5 font-bold">Email</label>
                        <input type="email" name="email" required
                               value="${fn:escapeXml(param.email)}"
                               class="w-full p-3 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>

                    <div class="mb-4">
                        <label class="block mb-1.5 font-bold">Address</label>
                        <textarea rows="3" name="address"
                                  class="w-full p-3 border border-gray-300 rounded-lg text-sm resize-none focus:outline-none focus:ring-2 focus:ring-emerald-500">${fn:escapeXml(param.address)}</textarea>
                    </div>

                    <div class="mb-4">
                        <label class="block mb-1.5 font-bold">Emergency Contact Number</label>
                        <input type="text" name="emergencyContactNumber"
                               value="${fn:escapeXml(param.emergencyContactNumber)}"
                               class="w-full p-3 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>

                    <div class="mb-4">
                        <label class="block mb-1.5 font-bold">Username</label>
                        <input type="text" name="username" required
                               value="${fn:escapeXml(param.username)}"
                               class="w-full p-3 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>

                    <div class="mb-4">
                        <label class="block mb-1.5 font-bold">Password</label>
                        <input type="password" name="password" required minlength="6"
                               class="w-full p-3 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>

                </div>

            </div>

            <div class="mt-8 text-center">
                <button type="submit" class="bg-emerald-500 hover:bg-emerald-600 text-white border-none py-3.5 px-11 rounded-lg text-lg cursor-pointer transition-colors">
                    Register
                </button>
            </div>

        </form>

    </div>

</div>

</body>
</html>